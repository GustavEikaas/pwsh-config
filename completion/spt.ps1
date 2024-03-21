using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'spt' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'spt'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'spt' {
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Set the tick rate (milliseconds): the lower the number the higher the FPS.')
            [CompletionResult]::new('--tick-rate', 'tick-rate', [CompletionResultType]::ParameterName, 'Set the tick rate (milliseconds): the lower the number the higher the FPS.')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Specify configuration file path.')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Specify configuration file path.')
            [CompletionResult]::new('--completions', 'completions', [CompletionResultType]::ParameterName, 'Generates completions for your preferred shell')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('playback', 'playback', [CompletionResultType]::ParameterValue, 'Interacts with the playback of a device')
            [CompletionResult]::new('play', 'play', [CompletionResultType]::ParameterValue, 'Plays a uri or another spotify item by name')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists devices, liked songs and playlists')
            [CompletionResult]::new('search', 'search', [CompletionResultType]::ParameterValue, 'Searches for tracks, albums and more')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'spt;playback' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Specifies the spotify device to use')
            [CompletionResult]::new('--device', 'device', [CompletionResultType]::ParameterName, 'Specifies the spotify device to use')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--transfer', 'transfer', [CompletionResultType]::ParameterName, 'Transfers the playback to new DEVICE')
            [CompletionResult]::new('--seek', 'seek', [CompletionResultType]::ParameterName, 'Jumps SECONDS forwards (+) or backwards (-)')
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Sets the volume of a device to VOLUME (1 - 100)')
            [CompletionResult]::new('--volume', 'volume', [CompletionResultType]::ParameterName, 'Sets the volume of a device to VOLUME (1 - 100)')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Pauses/resumes the playback of a device')
            [CompletionResult]::new('--toggle', 'toggle', [CompletionResultType]::ParameterName, 'Pauses/resumes the playback of a device')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Prints out the current status of a device (default)')
            [CompletionResult]::new('--status', 'status', [CompletionResultType]::ParameterName, 'Prints out the current status of a device (default)')
            [CompletionResult]::new('--share-track', 'share-track', [CompletionResultType]::ParameterName, 'Returns the url to the current track')
            [CompletionResult]::new('--share-album', 'share-album', [CompletionResultType]::ParameterName, 'Returns the url to the album of the current track')
            [CompletionResult]::new('--like', 'like', [CompletionResultType]::ParameterName, 'Likes the current song if possible')
            [CompletionResult]::new('--dislike', 'dislike', [CompletionResultType]::ParameterName, 'Dislikes the current song if possible')
            [CompletionResult]::new('--shuffle', 'shuffle', [CompletionResultType]::ParameterName, 'Toggles shuffle mode')
            [CompletionResult]::new('--repeat', 'repeat', [CompletionResultType]::ParameterName, 'Switches between repeat modes')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Jumps to the next song')
            [CompletionResult]::new('--next', 'next', [CompletionResultType]::ParameterName, 'Jumps to the next song')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Jumps to the previous song')
            [CompletionResult]::new('--previous', 'previous', [CompletionResultType]::ParameterName, 'Jumps to the previous song')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'spt;play' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Specifies the spotify device to use')
            [CompletionResult]::new('--device', 'device', [CompletionResultType]::ParameterName, 'Specifies the spotify device to use')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('-u', 'u', [CompletionResultType]::ParameterName, 'Plays the URI')
            [CompletionResult]::new('--uri', 'uri', [CompletionResultType]::ParameterName, 'Plays the URI')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Plays the first match with NAME from the specified category')
            [CompletionResult]::new('--name', 'name', [CompletionResultType]::ParameterName, 'Plays the first match with NAME from the specified category')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Adds track to queue instead of playing it directly')
            [CompletionResult]::new('--queue', 'queue', [CompletionResultType]::ParameterName, 'Adds track to queue instead of playing it directly')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Plays a random track (only works with playlists)')
            [CompletionResult]::new('--random', 'random', [CompletionResultType]::ParameterName, 'Plays a random track (only works with playlists)')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Looks for an album')
            [CompletionResult]::new('--album', 'album', [CompletionResultType]::ParameterName, 'Looks for an album')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Looks for an artist')
            [CompletionResult]::new('--artist', 'artist', [CompletionResultType]::ParameterName, 'Looks for an artist')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Looks for a track')
            [CompletionResult]::new('--track', 'track', [CompletionResultType]::ParameterName, 'Looks for a track')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Looks for a show')
            [CompletionResult]::new('--show', 'show', [CompletionResultType]::ParameterName, 'Looks for a show')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Looks for a playlist')
            [CompletionResult]::new('--playlist', 'playlist', [CompletionResultType]::ParameterName, 'Looks for a playlist')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'spt;list' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--limit', 'limit', [CompletionResultType]::ParameterName, 'Specifies the maximum number of results (1 - 50)')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Lists devices')
            [CompletionResult]::new('--devices', 'devices', [CompletionResultType]::ParameterName, 'Lists devices')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Lists playlists')
            [CompletionResult]::new('--playlists', 'playlists', [CompletionResultType]::ParameterName, 'Lists playlists')
            [CompletionResult]::new('--liked', 'liked', [CompletionResultType]::ParameterName, 'Lists liked songs')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'spt;search' {
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Specifies the output format')
            [CompletionResult]::new('--limit', 'limit', [CompletionResultType]::ParameterName, 'Specifies the maximum number of results (1 - 50)')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Looks for albums')
            [CompletionResult]::new('--albums', 'albums', [CompletionResultType]::ParameterName, 'Looks for albums')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Looks for artists')
            [CompletionResult]::new('--artists', 'artists', [CompletionResultType]::ParameterName, 'Looks for artists')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Looks for playlists')
            [CompletionResult]::new('--playlists', 'playlists', [CompletionResultType]::ParameterName, 'Looks for playlists')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Looks for tracks')
            [CompletionResult]::new('--tracks', 'tracks', [CompletionResultType]::ParameterName, 'Looks for tracks')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Looks for shows')
            [CompletionResult]::new('--shows', 'shows', [CompletionResultType]::ParameterName, 'Looks for shows')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'spt;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}

