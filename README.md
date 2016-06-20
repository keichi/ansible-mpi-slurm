# 汎用MPIクラスタ構築用Ansible Playbook

## 構築する環境の概要
- CentOS 7.x
- マスタの`/home`をNFSで共有
- マスタのアカウントをNISで共有
- マスタのNTPサーバをスレーブが参照
- マスタから全スレーブへSSHホストベース認証でログインできる
- OpenMPI
- OpenMPIの環境変数はenvironment-modulesで設定
- マスタにはgcc, gcc-gfortran, makeなどのコンパイルに必須のツール群

## 事前準備
- 全ノードにCentOS 7.xをインストール
- 全ノードのIPアドレスとホスト名を設定
- 全ノードへSSH公開鍵認証で入る設定

## 設定項目
- `master_hostname`: マスタノードのホスト名 (master.pepsi)
- `master_hostname_short`: マスタノードのホスト名 (master)
- `master_ip`: マスタノードのIP (10.0.10.2)
- `management_network`: 管理用ネットワークのサブネット (例: 10.0.10.0/24)

## Vagrantfile
Vagrant-libvirtプロバイダプラグインにより、KVM上で動作することを前提とした
Vagrantfileを添付している。デフォルトでは1台のマスタノードと4台のスレーブノード
を構築するが、スレーブの数は増減できる。Vagrantが生成する管理用のネットワーク
(`192.168.121.0/24`)とは別に、`10.0.10.0/24`というネットワークを生成し、各
ノードのIPアドレスを固定割り当てしている。

