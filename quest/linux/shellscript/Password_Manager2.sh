#!/bin/bash
encrypted_passfile=~/Documents/passsv.asc
passfile=~/Documents/passsv
source ./mail_address.conf

echo 'パスワードマネージャーへようこそ!'

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input

if [ "$input" = "Add Password" ]; then
	if   [ -e $encrypted_passfile ]; then
        	gpg $encrypted_passfile > /dev/null && rm $encrypted_passfile
	else
		touch $passfile
		echo "$passfileを新規作成しました"
	fi
        read -p "サービス名を入力してください:" ServiceName
        read -p "ユーザー名を入力してください:" UserName
        read -p "パスワードを入力してください:" PassWord
        echo "$ServiceName;$UserName;$PassWord" >> $passfile
        gpg -e -a -r "$mail_address" $passfile
	rm $passfile
elif [ "$input" = "Get Password" ]; then
	if [ -e $encrypted_passfile ]; then
		gpg $encrypted_passfile > /dev/null && rm $encrypted_passfile
        	read -p "サービス名を入力してください:" ServiceName 
        	while IFS=';' read -r -a elements; do
			if [ "${elements[0]}" = "$ServiceName" ]; then
	    			ServiceName1="${elements[0]}"
	    		   	UserName1="${elements[1]}"
	    		   	PassWord1="${elements[2]}"
			fi
		done < $passfile

        	if [ -n "$ServiceName1" ]; then 
			echo "$ServiceName1"
			echo "$UserName1"
        		echo "$PassWord1"
		else
			echo "そのサービスは登録されていません"
		fi
		gpg -e -a -r "$mail_address" "$passfile"
		rm $passfile
	else
	        echo "$passfileがありません"
	fi
elif [ "$input" = "Exit" ]; then
	echo "Thank you!"
else
	echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
fi
