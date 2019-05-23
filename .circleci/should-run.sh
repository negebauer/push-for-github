package=$SHOULD_RUN_PACKAGE
modified_files=$(git diff-tree --no-commit-id --name-only -r HEAD)
commit_message=$(git show -s --format=%B)

stop() {
  circleci step halt
  exit 0
}

echo "Checking valid SHOULD_RUN_PACKAGE env..."
if [[ -z $package ]]; then
  echo "no SHOULD_RUN_PACKAGE env for this step, fix this!"
  exit 1
fi

echo "Checking if chore commit..."
if [[ $commit_message == chore* ]]; then
  if [[ ! $commit_message == chore\(docker ]] \
    && [[ ! $commit_message == chore\(deploy ]] \
    && [[ ! $commit_message == chore\(ci ]]
    then
    echo "Chore commit, stopping"
    stop
  fi
fi

echo "Checking if package $SHOULD_RUN_PACKAGE changed"
if [[ ! $modified_files == *packages/$package/* ]]; then
  echo "No modified files for package $package, stopping"
  stop
fi

echo "Modified files for package $package, continue"
