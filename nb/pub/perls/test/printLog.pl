#!/usr/bin/perl
$::gDebugLevelProperty = 4;

printLog( 'TRACE',
"In _broSetAttr: called from \'$caller\' with brodId: \"$broId\", attrName: \"$attrName\", attrVal: \"$attrVal\"\n"
);

printLog( 'TRACE',
    "***************************************************************\n" );
printLog( 'TRACE', "In main(). Debug log opened\n" );

printLog( 'INFO', "Using BROData Project: \"$::gBRODataProject\"\n" );
printLog( 'INFO',
    "Using Template Data Project: \"$::gTemplateDataProject\"\n" );

sub printLog($$) {
    my $level   = shift;
    my $logData = shift;

  # Logging levels are ordered like this: TRACE < DEBUG < INFO <   WARN < ERROR.
  # The debugLevel set in the config project uses numbered levels. These numbers
  # are interpreted/translated into levels like this:

    # TRACE < DEBUG < INFO <   WARN < ERROR
    #   4      3       2        1       0
    
    # bail if level not high enough
    my %levels = (
        'TRACE'    => 4,
        'DEBUG' => 3,
        'INFO'    => 2,
        'WARN' => 1,
        'ERROR'    => 0
    );
    
    if ($levels{$level} > $::gDebugLevelProperty) {
        return;
    }

    $logData = "P:$$|" . "$logData";

    my $user;
    if ($::gCurrentUser) {
        $user = $::gCurrentUser;
    }
    else {
        $user = 'NotSetYet';
    }

    $logData = "U:$user|" . "$logData";
    
    print $level . '|' . 'briar' . '|' . $logData;
#    my $xPath =
#      $::gECommander->logMessage( "$logData",
#        { 'logger' => 'briar', 'level' => "$level" } );
}    # printLog

