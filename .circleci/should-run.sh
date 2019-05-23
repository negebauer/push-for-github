package_folder=$SHOULD_RUN_PACKAGE
modified_files=$(git diff-tree --no-commit-id --name-only -r HEAD)
commit_message=$(git show -s --format=%B)

stop() {
  circleci step halt
  exit 0
}

if [[ $package_folder == "NONE" ]]; then
  echo "no SHOULD_RUN_PACKAGE env for this step, fix this!"
  stop
fi

if [[ $commit_message == chore* ]]; then
  if [[ ! $commit_message == chore\(docker ]] \
    && [[ ! $commit_message == chore\(deploy ]] \
    && [[ ! $commit_message == chore\(ci ]]
    then
    echo "Chore commit, stopping"
    stop
  fi
fi

if [[ ! $modified_files == *packages/$package_folder/* ]]; then
  echo "No modified files for package $package_folder, stopping"
  stop
fi

echo "Modified files for package $package_folder, continue"
