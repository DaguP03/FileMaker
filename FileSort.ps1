#------------------------------------------------------------------------

# #コピー先フルパス
# $CurrentPath = Read-Host "コピー先のディレクトリのフルパスを入力してください。"


# #コピー元フルパス
# $SearchPath = Read-Host "コピー元のディレクトリのフルパスを入力してください。"

#コピー先フルパス
$CurrentPath = Read-Host "コピー先のディレクトリのフルパスを入力してください。"


#コピー元フルパス
$SearchPath = Read-Host "コピー元のディレクトリのフルパスを入力してください。"

#------------------------------------------------------------------------


#フォルダ名変数

#------------

# $targetFolder内のファイル・フォルダのリストを取得する。
$itemList = Get-ChildItem $CurrentPath;
foreach($item in $itemList)
{
    $itemName = Get-ChildItem -Path $item -Name
    Write-Output $itemName
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


