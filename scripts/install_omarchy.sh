#!/bin/bash

# Recursive symlink function
recursive_symlink() {
  local source_dir="$1"
  local target_dir="$2"

  # Create target directory if it doesn't exist
  mkdir -p "$target_dir"

  # Find all files in source directory and symlink them
  find "$source_dir" -type f | while read -r source_file; do
    # Get relative path from source directory
    local relative_path="${source_file#$source_dir/}"
    # Create target file path
    local target_file="$target_dir/$relative_path"

    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target_file")"

    # Remove existing file or symlink if present
    rm -f "$target_file"

    # Create symlink
    ln -s "$source_file" "$target_file"

    echo "Symlinked: $relative_path"
  done
}

# Run the recursive symlink function
recursive_symlink "$(pwd)/.config/hypr" "$HOME/.config/hypr"
recursive_symlink "$(pwd)/.config/omarchy" "$HOME/.config/omarchy"
recursive_symlink "$(pwd)/.config/waybar" "$HOME/.config/waybar"

echo "Omarchy configuration symlinked successfully"
