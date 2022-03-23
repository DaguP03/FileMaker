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
$Flag2=0
#---------------------------------------------------------------------------

#関数-----------------------------------------------------------------------
function SecondSearch([String]$Second_SearchPath,[String]$Second_CurrentPath){
    $Ser_itemList2 = Get-ChildItem $Second_SearchPath;
    $Cur_itemList2 = Get-ChildItem $Second_CurrentPath;

    foreach($Ser_item2 in $Ser_itemList2)
    {
        $Ser_itemName2 =  $Ser_item2.Name
    
        #コピー先のフォルダとの比較。
        foreach($Cur_item2 in $Cur_itemList2)
        {
            $Cur_itemName2 =  $Cur_item2.Name
            #コピー先にフォルダ名前があるなら
            if($Cur_itemName2 -eq $Ser_itemName2)
            {
                $Flag2 =1
                break
            }
        }

        if ($Flag2 -eq 0)
        {
            Copy-Item -Path $Ser_item2.FullName-Recurse $Second_CurrentPath
        }
    }
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
        $Cur_itemName =  $Cur_item.Name
        #コピー先にフォルダ名前があるなら
        if($Cur_itemName -eq $Ser_itemName)
        {
            #一つ下のフォルダのサーチ
            SecondSearch $Ser_item.FullName $Cur_item.FullName
            $Flag =1
        }
    }
    
    if ($Flag -eq 0)
    {
        Copy-Item -Path $Ser_item.FullName -Recurse $CurrentPath
    }
} 



