#!/bin/bash
encrypted_passfile=~/Documents/passsv.asc
passfile=~/Documents/passsv
source ./mail_address.conf

echo 'パスワードマネージャーへようこそ!'

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input

# Add Passwordが入力された場合
if [ "$input" = "Add Password" ]; then
	if   [ -e $encrypted_passfile ]; then
        	gpg $encrypted_passfile > /dev/null && rm $encrypted_passfile
	else
		touch $passfile
		echo "$passfileを新規作成しました"
	fi
        read -p "サービス名を入力してください:" In_ServiceName
        read -p "ユーザー名を入力してください:" In_UserName
        read -p "パスワードを入力してください:" In_PassWord
        echo "$In_ServiceName;$In_UserName;$In_PassWord" >> $passfile
        gpg -e -a -r "$mail_address" $passfile
	rm $passfile
# Get Passwordが入力された場合
elif [ "$input" = "Get Password" ]; then
	if [ -e $encrypted_passfile ]; then
		gpg $encrypted_passfile > /dev/null && rm $encrypted_passfile
        	read -p "サービス名を入力してください:" In_ServiceName 
        	while IFS=';' read -r -a elements; do
			if [ "${elements[0]}" = "$In_ServiceName" ]; then
	    			Out_ServiceName="${elements[0]}"
	    		   	Out_UserName="${elements[1]}"
	    		   	Out_PassWord="${elements[2]}"
			fi
		done < $passfile

        	if [ -n "$Out_ServiceName" ]; then 
			echo "$Out_ServiceName"
			echo "$Out_UserName"
        		echo "$Out_PassWord"
		else
			echo "そのサービスは登録されていません"
		fi
		gpg -e -a -r "$mail_address" "$passfile"
		rm $passfile
	else
	        echo "$passfileがありません"
	fi
# Exitが入力された場合
elif [ "$input" = "Exit" ]; then
	echo "Thank you!"
# Add Password/Get Password/Exit 以外が入力された場合
else
	echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
fi
