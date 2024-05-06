#!/bin/bash

# 生成带有日期时间戳的输出文件名
output_file="sshlist_$(date +"%Y%m%d%H%M").json"

# 构建完整的JSON字符串
json_data="{
  \"magic\": \"nassh-prefs\",
  \"version\": 1,
  \"nassh\": {
    \"profile-ids\": [
"

# 读取sshlist.txt文件的每一行，并逐行处理
while IFS= read -r line
do
  # 解析每一行的数据
  name=$(echo "$line" | awk '{print $1 "-" $3}')
  username=$(echo "$line" | awk '{print $2}')
  hostname=$(echo "$line" | awk '{print $3}')
  port=$(echo "$line" | awk '{print $4}')

  # 构建JSON对象
  json="{\"json\": {\"description\":\"$name\",\"username\":\"$username\",\"hostname\":\"$hostname\",\"port\":$port}}"

  # 将JSON对象添加到完整的JSON字符串
  json_data+="\n$json,"
done < sshlist.txt

# 删除最后一个JSON对象后的逗号
json_data=${json_data%?}

# 完整的JSON字符串结尾
json_data+="
    ],
    \"welcome/notes-version\": 1,
    \"welcome/show-count\": 10
  },
  \"hterm\": {
    \"default\": {
      \"font-size\": \"20\",
      \"scrollbar-visible\": false
    }
  }
}"

# 将完整的JSON字符串写入输出JSON文件
echo "$json_data" > "$output_file"

echo "生成的JSON文件已保存为$output_file"
