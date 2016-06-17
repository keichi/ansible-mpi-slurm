# SDN-enhanced JMS動作用環境構築
## 前提環境
スレーブノードがNAT裏にあり、sshで直接外部からは入れないような環境を想定。

### マスターノード
- CentOS 6.7
- eth0: management (192.168.69.100)
- eth1: data plane (10.0.0.100)
- eth2: control plane (192.168.0.100)

### スレーブノード
- Fedora 20
- eth0: management (192.168.69.101~120)
- eth1: data plane (10.0.0.101~120)

## Ansibleを実行する前にしておくべきこと
- 各ノードのIPアドレス、ホスト名の設定
- SSH公開鍵認証でマスターから各スレーブに入る設定
- SDN-enhanced JMS本体のコード群を/root以下に配置

## インストール方法
マスターノード上で以下を実行
```
./provision.sh
```
