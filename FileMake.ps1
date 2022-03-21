#------------------------------------------------------------------------

#【設定】Excelファイルのパス
$bookPath = "F:\UserFolder\Documents\Program\MySource\powershell\FileMaker.xlsx"

#【設定】対象のシート名
$sheetName = "Sheet1"

#------------------------------------------------------------------------


#Excel起動
$excel = New-Object -ComObject Excel.Application

#可視化設定（通常利用時はFalse。挙動確認の際はTrueだとわかりやすい。）
#$excel.Visible = $False
$excel.Visible = $True

#アラート無効化
$excel.DisplayAlerts = $False

#Excelファイル（ブック）を開く
$book = $excel.Workbooks.Open($bookPath)

#処理対象のシートを取得
$sheet = $book.Sheets($sheetName)

#ベースとなるセル番号
$BaseColumn = 3
$BaseRow = 3

#作るフォルダ名,個数
$FolderName = "";
$FolderNumber  = "";

#フォルダ名変数

#------------

for( $i = 0; $i -lt 3; $i++){

    $FolderName = $sheet.Cells($BaseColumn+$i,$BaseRow).Text
    $FolderStartNum =$sheet.Cells($BaseColumn+$i,$BaseRow+1).Text 
    $FolderNumber =$sheet.Cells($BaseColumn+$i,$BaseRow+2).Text
    $FolderMake = "RQ-SW-"+$FolderName

    #値が入力されていないのなら、ループを辞める
    if ("" -eq $FolderName -or "" -eq $FolderStartNum -or "" -eq $FolderNumber) {
        break;
    }

    $FolderStartNum = [int] $FolderStartNum
    $FolderNumber = [int] $FolderNumber
    
    New-Item -Path . -ItemType Directory -Name $FolderMake
    
    for($j = $FolderStartNum; $j -lt $FolderNumber+1; $j++){
        #フォルダを中に『作りたい個数』分生成
        New-Item -Path ./$FolderMake -ItemType Directory -Name $j
    }
}
#------------


#検証終了時は以下を実行
#------------------------------------------------------------------------
#Excel終了
$excel.Quit()

#プロセス解放
$excel = $Null
[GC]::collect()
#------------------------------------------------------------------------