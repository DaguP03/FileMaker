#------------------------------------------------------------------------

#【設定】Excelファイルのパス
$bookPath = "F:\UserFolder\Documents\Program\MySource\powershell\FileMaker.xlsx"

#【設定】対象のシート名
$sheetName = "Sheet1"

#------------------------------------------------------------------------


#フォルダ名変数

#------------

# 処理対象のフォルダ
$targetFolder = 'C:\temp\test';
 
# $targetFolder内のファイル・フォルダのリストを取得する。
$itemList = Get-ChildItem $targetFolder;
foreach($item in $itemList)
{
    # PSIsContainer でファイルかフォルダかを判定
    if($item.PSIsContainer)
    {
        # フォルダの場合の処理
        Write-Host ($item.Name + 'はフォルダです。'); 
    }
    else
    {
        # ファイルの場合の処理
        Write-Host ($item.Name + 'はファイルです。'); 
    }
} 
# for( $i = 0; $i -lt 3; $i++){

#     $FolderName = $sheet.Cells($BaseColumn+$i,$BaseRow).Text
#     $FolderStartNum =$sheet.Cells($BaseColumn+$i,$BaseRow+1).Text 
#     $FolderNumber =$sheet.Cells($BaseColumn+$i,$BaseRow+2).Text
#     $FolderMake = "RQ-SW-"+$FolderName

#     #値が入力されていないのなら、ループを辞める
#     if ("" -eq $FolderName -or "" -eq $FolderStartNum -or "" -eq $FolderNumber) {
#         break;
#     }

#     $FolderStartNum = [int] $FolderStartNum
#     $FolderNumber = [int] $FolderNumber
    
#     New-Item -Path . -ItemType Directory -Name $FolderMake
    
#     for($j = $FolderStartNum; $j -lt $FolderNumber+1; $j++){
#         #フォルダを中に『作りたい個数』分生成
#         New-Item -Path ./$FolderMake -ItemType Directory -Name $j
#     }
# }
#------------


#検証終了時は以下を実行
#------------------------------------------------------------------------
#Excel終了
$excel.Quit()

#プロセス解放
$excel = $Null
[GC]::collect()
#------------------------------------------------------------------------