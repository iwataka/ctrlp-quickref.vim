## イントロダクション

Vimでプログラムを書いていると、自分が使っているライブラリのソースコードを確認し
たくなったり、過去に書いたプログラムを参照したくなったり、その他PDFのドキュメン
トを開きたくなったりすることがよくあります。そういったときにVimの中から一瞬で目
的のファイルを開くことができるような機能が欲しいと思い、プラグインを作成しようと
思い立ちました。今回作成したプラグインは
[ctrlp-quickref.vim](https://github.com/iwataka/ctrlp-quickref.vim)という名前で
、その名の通り、Vimプラグインとして有名な
[CtrlP](https://github.com/kien/ctrlp.vim)の機能をベースにした拡張プラグインです
。

## デモンストレーション

CtrlPのインターフェースを2回続けて利用します。
1回目は自分が登録したパスが表示され、そこから検索したいパスを選択します。
2回目は先ほど選択したパスを検索した結果が表示され、開きたいファイルを選択して終
了です。

![Demo](https://github.com/iwataka/images/blob/master/quickref.gif)

## 使い方

このプラグインをインストールしたら、1回目のCtrlPのインターフェースに表示されるパ
スを登録しなければなりません。登録する方法は2つあり、1つは自分のvimrcに以下のよ
うにg:ctrlp_quickref_paths変数を作成します。

    let g:ctrlp_quickref_paths = [
        \ '/directory1/library_or_something_else/src',
        \ '/directory2/*/src',
        \ '/directory3/*',
        " You want to exclude specified directory, put '!' at the head.
        \ '! /directory3/library_or_something_else/'
    ]

複数のパスを登録するためにワイルドカードが使用でき、除外したいパスがあれば"!"を
先頭において指定することができます。

2つ目の登録方法は、~/.ctrlp-quickrefファイルを作成し、そこにパスを書き込むという
ものです。例としては以下のようになります。

    # Write
    # Some
    # Comments
    /directory1/library_or_something_else/src
    /directory2/*/src

    # Additional comment
    /directory3/*

    # You can also exclude specified directory by writing like this
    ! /directory3/library_or_something_else

gitignoreなど構文を意識して作成しました。

上の2つのうちのどちらかの方法でパスを登録したら、後は:CtrlPQuickRefコマンドを実
行するだけです。CtrlPインターフェースが開き、自分が登録したパスの中から一つを選
択します。再度CtrlPインタフェースが開き、選択したパスにおける検索結果が今度は表
示されます。

## コマンド

+ :CtrlPQuickRef

    CtrlPのインタフェースを開き、自分が登録したパスを選択肢として表示します。

+ :CtrlPQuickRefLastDir

    CtrlPを、自分が最後に選択したパスを引数として実行します。

+ :CtrlPQuickRefEdit

    自分のパスを登録しているファイル(デフォルトでは~/.ctrlp-quickref)を開きます
    。自分のvimrcに全て登録している場合は何も起こりません。

## オプション

+ ctrlp_quickref_readonly_enabled

    デフォルトではreadonlyフラグをつけてファイルを開きますが、この変数の値を0に
    するとreadonlyフラグをつけずにファイルを開くことができます。

+ ctrlp_quickref_open_extensions

    このリストに含まれている拡張子のファイルを開く場合は、Macではopen、Linuxでは
    xdg-openで自動的に開かれます。デフォルトでは['html', 'pdf']となっています。

+ ctrlp_quickref_configuration_file

    パスを登録するファイルを指定します。デフォルトでは~/.ctrlp-quickrefです。

+ ctrlp_quickref_paths

    パスの登録をvimrc内で行う場合、この変数にリストとして登録します。

## 必要なプラグインなど

+ [ctrlp.vim](https://github.com/kien/ctrlp.vim)

+ xdg-open command (Linuxユーザのみ)

+ [ctrlp-py-matcher](https://github.com/FelikZ/ctrlp-py-matcher)

    これは不可欠ではありませんが、大きなプロジェクトなどに適用する場合には絞り込
    みが早くなるのでおすすめです。

+ [the_silver_searhcer](https://github.com/ggreer/the_silver_searcher)

    CtrlPユーザの多くが使っているかもしれませんが、これもおすすめしておきます。
