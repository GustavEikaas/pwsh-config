<#
.SYNOPSIS
    dotnet run <args>
#>
function ddr {
  dotnet run $args
}

<#
.SYNOPSIS
    dotnet test <args>
#>
function ddt {
  dotnet test $args
}

<#
.SYNOPSIS
    dotnet build <args> 
#>
function ddb {
  dotnet build $args
}
