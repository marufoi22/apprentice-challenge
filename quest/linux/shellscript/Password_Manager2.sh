#!/bin/bash
echo 'パスワードマネージャーへようこそ!'

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input

if [ "$input" = "Add Password" ]; then
	gpg PASS.conf.gpg
        read -p "サービス名を入力してください:" ServiceName
        read -p "ユーザー名を入力してください:" UserName
        read -p "パスワードを入力してください:" PassWord
        echo "$ServiceName;$UserName;$PassWord" >> PASS.conf
	gpg -c PASS.conf
	rm PASS.conf
elif [ "$input" = "Get Password" ]; then
	gpg PASS.conf.gpg
        read -p "サービス名を入力してください:" ServiceName 
        while IFS=';' read -r -a elements; do
		if [ "${elements[0]}" = "$ServiceName" ]; then
	    		ServiceName1="${elements[0]}"
	    		   UserName1="${elements[1]}"
	    		   PassWord1="${elements[2]}"
		fi
	done < PASS.conf

        if [ -n "$ServiceName1" ]; then 
		echo "$ServiceName1"
		echo "$UserName1"
        	echo "$PassWord1"
	else
		echo "そのサービスは登録されていません"
	fi
	gpg -c PASS.conf
	rm PASS.conf
elif [ "$input" = "Exit" ]; then
	echo "Thank you!"
else
	echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
fi
