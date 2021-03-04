$result = Select-String -Path *.tf -Pattern "^resource"
if ($result) {
    $result
    exit 1
}
else {
    exit 0
}