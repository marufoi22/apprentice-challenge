# パーミッションを操作できる

## 1. ファイルのオーナーとグループ

ホームディレクトリの直下に、README.md という名前の空ファイルを作成してください。

```shell-session
touch ~/README.md
```
その上で、README.md ファイルのオーナーとグループを確認してください。

```shell-session
ls -l
```

## 2. ファイルのパーミッション

README.md ファイルのパーミッションを確認し、誰に何の権限が付与されているかを説明してください。

>
>-rw-rw-r-- 1 yuki yuki    0 Mar 31 15:04 README.md
>
| ユーザ種別 | 読み取り | 書き込み | 実行 |
| ---- | ---- | ---- | ----|
| オーナー | 許可 | 許可 | 禁止 |
| yukiグループに所属するユーザ | 許可 | 許可 | 禁止 |
|その他グループ | 許可 | 禁止 | 禁止 |

## 3. ファイルのパーミッションの設定

README.md ファイルのオーナーに対して、読み取り、書き込み、実行の全ての権限を付与してください。

```shell-session
chmod u+x README.md
```

## 4. ディレクトリのパーミッションの設定

ホームディレクトリの直下に、permission という名前の空ディレクトリを作成してください。

```shell-session
mkdir ~/permission
```

permission ディレクトリのグループに対して、書き込み権限を付与してください。

```shell-session
chmod g+w permission
```

## 5. スーパーユーザー

スーパーユーザーとして、ホームディレクトリの直下に superuser という名前の空ディレクトリを作成してください。

```shell-session
sudo su -
mkdir ~/superuser
```
作成後、superuser ディレクトリのオーナーが誰かを確認してください。

```
ls -ld ~/superuser
```
