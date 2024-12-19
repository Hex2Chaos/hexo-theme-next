#!/bin/bash

# 遍历当前目录及子目录中的所有文件，跳过 .git 目录
find . -type f -not -path '*/\.git/*' | while read -r file; do
    # 检查文件是否可写
    if [ -w "$file" ]; then
        # 使用 sed 删除包含冲突标记的行，并将结果写回原文件
        sed -i '/^<<<<<<< /d; /^=======/d; /^>>>>>>> /d' "$file"
        echo "已处理文件: $file"
    else
        echo "跳过不可写文件: $file"
    fi
done

echo "所有文件处理完成。"
