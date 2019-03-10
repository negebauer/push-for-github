package_folder=$1
modified_files=$(git diff-tree --no-commit-id --name-only -r HEAD)

if [[ $modified_files == packages/$package_folder* ]]; then
  echo "Modified files package $package_folder"
else
  echo "No modified files package $package_folder, stopping"
  circleci step halt
fi
