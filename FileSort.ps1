#------------------------------------------------------------------------

# #コピー先フルパス
# $CurrentPath = Read-Host "コピー先のディレクトリのフルパスを入力してください。"


# #コピー元フルパス
# $SearchPath = Read-Host "コピー元のディレクトリのフルパスを入力してください。"

#コピー先フルパス
$CurrentPath = "F:\UserFolder\Music\ミュージック\Test用\コピー先フォルダ"


#コピー元フルパス
$SearchPath = "F:\UserFolder\Music\ミュージック\Test用\コピー元フォルダ"

#------------------------------------------------------------------------


#変数-----------------------------------------------------------------------
$Flag=0
#---------------------------------------------------------------------------

#関数-----------------------------------------------------------------------
function SecondSearch($Second_SearchPath,$Second_CurrentPath){
            
}

function CopyFolder($Second_SearchPath,$Second_CurrentPath){
    
}
#---------------------------------------------------------------------------
# $SearchPass内のファイル・フォルダのリストを取得する。
$Ser_itemList = Get-ChildItem $SearchPath;
$Cur_itemList = Get-ChildItem $CurrentPath;

#最初のフォルダのサーチ
foreach($Ser_item in $Ser_itemList)
{
    $Ser_itemName =  $Ser_item.Name

    #コピー先のフォルダとの比較。
    foreach($Cur_item in $Cur_itemList)
    {
        $Ser_itemName =  $Ser_item.Name
        #コピー先にフォルダ名前があるなら
        if($Cur_item -eq $Ser_itemName)
        {
            SecondSearch($Ser_item.FullName,$Cur_item.FullName)
            $Flag =1
        }
    }
    
    if ($Flag -eq 0)
    {
        CopyFolder($Ser_item.FullName,$Cur_item.FullName)
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


