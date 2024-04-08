# GitHub を使って開発を進めることができる

## 1. リモートリポジトリ

GitHub 上に新規リポジトリを作成してください。

## 2. プッシュ

ローカルの PC 上に GitHub 上で作成したリポジトリの同じ名前のディレクトリを作成し、そのディレクトリ内に README.md　ファイルを作成してください。

```shell-session
mkdir git_develop
touch README.md
```

次に、ローカルリポジトリを新規作成し、変更をステージに追加、コミットしてください。

```shell-session
git init
git add README.md
git commit -v
```

リモートリポジトリを登録してください。そして GitHub に変更をプッシュしてください。

```shell-session
git remote add develop https://github.com/yukimaensoono/git_develop.git
git push develop master
```

## 3. 追加の変更をプッシュ

README.md に変更を追加してください。そしてその変更を GitHub にプッシュしてください。

```shell-session
git add README.md
git commit -v
git push develop master
```

## 4. クローン

GitHub 上にある他者が作成したリポジトリを自分の PC 上にクローンしてください。クローン対象は何でも良いです。

```shell-session
git clone <リポジトリ名>
```
