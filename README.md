# atcoder-python-env

Docker上で動く、Atcoder用のPython環境です。
VSCodeのRemote Containerを使って、VSCode上で動かすことを想定しています。

## 環境構築

### インストール

```bash
C:\Users\user> git clone git@github.com:ishiyamato/atcoder-python-env.git
C:\Users\user> cd atcoder-python-env
```

#### Visual Studio Code

https://code.visualstudio.com/ から、VSCodeをインストールしてください。

#### Docker Desktop

https://docs.docker.com/get-docker/ から、Docker Desktopをインストールしてください。

### Dockerコンテナの起動

```bash
C:\Users\user\atcoder-python-env> docker compose up -d
```

### VSCodeからコンテナに接続

VSCodeを開き、左下端の[><]ボタンから、`実行中のコンテナにアタッチ`を選択してください。

### 問題の取得

VSCode内でターミナルを開き、取得したい問題のコンテスト名を引数にして、`agen`を実行してください。 ex) `agen abc333`

フォルダが作成され、その中に問題ごとのフォルダが作成されます。中にある`main.py`を適切に編集してください。

```bash
root@container:~/atcoder-workspace# agen abc333
root@container:~/atcoder-workspace# ls
abc333
root@container:~/atcoder-workspace# ls abc333
A  B  C  D  E  F
root@container:~/atcoder-workspace# ls abc333/A
in_1.txt  in_2.txt  main.py  metadata.json  out_1.txt  out_2.txt
root@container:~/atcoder-workspace# cd abc333/A
root@container:~/atcoder-workspace/abc333/A# code main.py
```

### テスト

`main.py`があるフォルダ内で、ターミナルで`atest`を実行してください。

```bash
root@container:~/atcoder-workspace/abc333/A# atest
```

### 提出

`main.py`があるフォルダ内で、ターミナルで`asub`を実行してください。

ただし、これまで１度もログインしていない場合にはログインが必要となります。提出の前に`agenlogin`を実行し、Atcoderのアカウントでログインしてください。

```bash
root@container:~/atcoder-workspace/abc333/A# agenlogin abc001 # ログインしていない場合のみ
AtCoder username: user
AtCoder password:
root@container:~/atcoder-workspace/abc333/A# asub
```

## コマンドエイリアス

### 問題取得

`agen` : `atcoder-tools --without-login gen`
  - ログインせずに問題を生成します
  - `agenlogin`を実行してログインしておくと、submitが楽になります

`agenlogin` : `atcoder-tools gen`
  - ログインして取得 最初はこれで問題を生成しておくと、submitが楽になります

### テスト

`atest` : `atcoder-tools test`
  - 問題のディレクトリでatestすると、テストしてくれます

### 提出

`asub` : `atcoder-tools submit`
  - 問題のディレクトリでasubすると、テストしてから提出してくれます
  - `-f`すると、テスト結果によらずsubmitされます
    - 不定性のある問題(複数答えがあるうちの1つを構成、など)のときには`-f`をすると、気にせず提出できます
