#!/bin/bash
echo 'パスワードマネージャーへようこそ!'
read -p "サービス名を入力してください:" ServiceName
read -p "ユーザー名を入力してください:" UserName
read -p "パスワードを入力してください:" PassWord

echo "$ServiceName;$UserName;$PassWord" >> PASS.conf
echo "Thank you"
