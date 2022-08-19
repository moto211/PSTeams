﻿Import-Module .\PSTeams.psd1 -Force

$Objects = @(
    [PSCustomObject] @{
        Test  = 123
        Test2 = "Tes1t"
    }
    [PSCustomObject] @{
        Test  = 456
        Test2 = "Test2"
    }
    [PSCustomObject] @{
        Test  = 789
        Test2 = "Test3"
    }
)
$ObjectsHashes = @(
    [ordered] @{
        Test  = 123
        Test2 = "Tes1t"
    }
    [ordered] @{
        Test  = 456
        Test2 = "Test2"
    }
    [ordered] @{
        Test  = 789
        Test2 = "Test3"
    }
)

$Card = New-AdaptiveCard {
    New-AdaptiveTextBlock -Size 'Medium' -Weight Bolder -Text 'Table usage with PSCustomObject' -Separator -Wrap

    New-AdaptiveTable -DataTable $Objects

    New-AdaptiveTextBlock -Size 'Medium' -Weight Bolder -Text 'Table usage with OrderedDictionary' -Separator -Wrap

    New-AdaptiveTable -DataTable $ObjectsHashes
} -Uri $Env:TEAMSPESTERID -FullWidth -ReturnJson

$Card | ConvertFrom-Json | ConvertTo-Json -Depth 20