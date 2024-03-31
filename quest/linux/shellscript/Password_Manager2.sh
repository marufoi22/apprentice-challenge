#!/bin/bash
echo 'パスワードマネージャーへようこそ!'

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input

if [ "$input" = "Add Password" ]; then
        read -p "サービス名を入力してください:" ServiceName
        read -p "ユーザー名を入力してください:" UserName
        read -p "パスワードを入力してください:" PassWord
        echo "$ServiceName;$UserName;$PassWord" >> PASS.conf
fi
echo "Thank you"
