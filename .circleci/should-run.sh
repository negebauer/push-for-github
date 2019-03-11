package_folder=$1
modified_files=$(git diff-tree --no-commit-id --name-only -r HEAD)
commit_message=$(git show -s --format=%B)

stop() {
  circleci step halt
  return 0
}

if [[ ! $modified_files == *packages/$package_folder/* ]]; then
  echo "No modified files for package $package_folder, stopping"
  stop
fi

echo "Modified files for package $package_folder, continue"

if [[ $commit_message == chore* ]]; then
  if [[ ! $commit_message == chore\(docker ]] \
    || [[ ! $commit_message == chore\(deploy ]] \
    || [[ ! $commit_message == chore\(ci ]]
    then
    echo "Chore commit, stopping"
    stop
  fi
fi
