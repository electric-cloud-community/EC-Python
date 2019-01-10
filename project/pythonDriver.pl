# -------------------------------------------------------------------------
# Package
#    pythonDriver.pl
#
# Dependencies
#    None
#
# Purpose
#    Executes python code
#
# Template Version
#    1.0
#
# Date
#    11/02/2011
#
# Engineer
#    Carlos Rojas
#
# Copyright (c) 2011 Electric Cloud, Inc.
# All rights reserved
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# Includes
# -------------------------------------------------------------------------
use ElectricCommander;
use warnings;
use strict; 
$|=1;

sub main{
    my $ec = ElectricCommander->new();
    $ec->abortOnError(0);
    my $pythonCode      = ($ec->getProperty( "pythonCode" ))->findvalue('//value')->string_value;
    my $pythonFile      = ($ec->getProperty( "pythonFile" ))->findvalue('//value')->string_value;
    my $pythonLocation  = ($ec->getProperty( "pythonLocation" ))->findvalue('//value')->string_value;
    
    my @args = ();
    
    if($pythonLocation && $pythonLocation ne ""){
        push(@args,qq{"$pythonLocation"});
    }else{
        push(@args,"python");
    }
    
    if($pythonFile && $pythonFile ne ""){
        push(@args,qq{"$pythonFile"});
    }else{
        my $code = "$pythonCode";
        open(MYFILE, '>>file.py');
        print MYFILE "$code";
        close(MYFILE);
        push(@args,"file.py");
    }

    $ec->setProperty("/myCall/pythonCommandLine", join(" ",@args));
    
}

main();

