package_folder=$1
modified_files=$(git diff-tree --no-commit-id --name-only -r HEAD)

if [[ $modified_files == packages/$package_folder* ]]; then
  echo "Modified files for package $package_folder, continue"
else
  echo "No modified files for package $package_folder, stopping"
  circleci step halt
fi
