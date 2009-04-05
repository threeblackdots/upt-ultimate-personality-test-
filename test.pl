#!/usr/bin/perl
use warnings;
use strict;

#Key Values
# $question counts the question number
my $Q = 0;
# $total is the score which the results are based on. This value gets lower as the test continues. 
my $total = 100; 

#Other values
# $loopnum counts the number of loops and exits the program if too many have been run
my $loopnum = 0;
# $name is the name of the taker. 
my $name;
my $ask = 0;
my $answer;
my $question;
my @answers;
my $pop;

#Information
print "----------------------------------------------\n";
print "Welcome to the G.E.E.K. test: proof of concept\n";
print "----------------------------------------------\n";
print "This test is designed to measure your G.E.E.K. factor.\n";  
print "Please note that this test is currently in development and as this is very inaccurate.\n";
print "--------------------------------------------------------------------------------------\n";
print "Check out www.drop.io/perltest for the latest version of this test\n";
print "If you have any comments or suggestions please email me at ellipsis18\@zoho.com\n";
print "----------------------------------------------\n";

#Pre-test

print "Would you like to continue?\n";
print "---------------------------\n";


CONTINUE: while () {
	#add one run to the loop count  
	$loopnum= $loopnum +1; 
	# $continue is the standard continue variable in this test
	my $continue = <>;
	chomp $continue; 
	
	if ( $continue =~ m/^(\s+)?(yes)(\s+)?|^(\s+)?y(\s+)?/ ) {
		#reset $loopnum so it can be used elsewhere and exit CONTINUE.  
		$loopnum = 0;
		last;
	} elsif ( $continue =~ m/^(\s+)?(no)(\s+)?|^(\s+)?n(\s+)?/ ) {
		print "Goodbye\n";
		exit;
	} else {
		#continue if loopnum is less than or equal to 3 otherwise print a error and exit the program. 
		if ( $loopnum <= 3 ) {
			print "I can't understand that. Can you please enter your answer again.\n";
			goto CONTINUE;
		} else {
			print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
			exit; 
		}
	}
} 

#Your Name...for that personal touch.
print "What is your name?\n";
print "------------------\n";

NAME: while () {
	#add one run to the loop count  
	$loopnum = $loopnum + 1;
	# $continue is the standard continue variable in this test
	my $name = <>;
	chomp $name;
	if ( $name =~ m/^(\s+)?\w+(.+)?/ ) {
		#Reset $loopnum and exit NAME
		$loopnum = 0;
		print "Welcome $name , please choose the BEST answer to the questions.\n";
		last NAME; 
	} else {
		#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
		if ( $loopnum <= 3 ) {
			print "I can't understand that. Please enter your first name.\n";
			goto NAME;
		} else {
			print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
			exit; 
		}
	}
}

MULTICHOICE: while(){
	################################################################################################
	################################################################################################
	print "SECTION ONE: MY REFLECTION\n";
	print "--------------------------\n";
	####################################Question ONE################################################
	$question = askquestion( $Q );
	print "$question: Do you wear glasses?\n";
	print "----------------------------------------------------------\n";
	print "a) No, I wear contacts\n";
	print "b) No, I don't need any.\n";
	print "c) Yes, I wear glasses.\n";
	print "d) Yes, and they are broken in someway.\n";
	$total = subtract1 ();
	$loopnum = 0;
	####################################Question TWO################################################

	####################################Question THREE##############################################

	####################################Question FOUR###############################################


	####################################Question FIVE###############################################

	####################################SECTION TWO#################################################
	################################################################################################
	print "SECTION TWO: OPINIONS AND BELIEFS\n";
	print "---------------------------------\n";
	####################################Question SIX################################################
	$question = askquestion( $Q );
	print "$question: Have you ever seriously debated the merits of various Operating Systems?\n";
	print "----------------------------------------------------------\n";
	print "a) Yes.\n";
	print "b) Have better things to do.\n";
	print "c) I don't know enough to discuss it.\n";
	print "d) Operating System? What is that?\n";
	$total = subtract2 ();
	$loopnum = 0;
	####################################Question SEVEN################################################
	
	####################################Question EIGHT################################################

	####################################Question NINE#################################################

	####################################Question TEN##################################################

	####################################SECTION FOUR##################################################
	##################################################################################################
	print "SECTION THREE: A TYPICAL DAY\n";
	print "---------------------------------\n";
        ####################################Question ELVEN################################################

	####################################Question TWELVE###############################################

	####################################Question THIRTEEN#############################################

	####################################Question FOURTEEN#############################################

	####################################Question FIFTHTEEN############################################

	#########################################SECTION FOUR#############################################
	##################################################################################################
	print "SECTION FOUR: WHAT I KNOW\n";
	print "-------------------------\n";
	####################################Question SIXTEEN##############################################

	####################################Question SEVENTEEN############################################

	####################################Question EIGHTEEN#############################################

	####################################Question NINETEEN#############################################
	
	####################################Question TWENTY###############################################
	last; 
}

RESULTS: while() {
	if($total <= 25) {
		print "GEEK\n";
	} elsif ($total > 25 && $total <= 50) {
		print "More or less Geek\n";
	} elsif ($total > 50 && $total <= 75) {
		print "Not very Geek\n";
	} elsif ($total > 75) {
		print "Please don't take my lunch money\n";
	} else {
		print "Error in total calculation. Please update to a newer version.\n";
	}
	while ( pop @answers ) {
		$pop = pop @answers;
		print "$Q:$pop\n";
		$Q = $Q - 1;
		
	}
	exit;
}
	
sub subtract1 {
	SUBTRACT: while (1) {
		$answer = <>;
		chomp $answer;
		push @answers, $answer;
	
		 if ( $answer =~ m/a|A/ ) {
			$total = $total;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/B|b/ ) {
			$total = $total - 1;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/C|c/ ) {
			$total = $total - 2;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/D|d/ ) {
			$total = $total - 3;
			$loopnum = 0;
			return $total;
		} else {
			#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
			if ( $loopnum <= 3 ) {
				print "I can't understand that. Please pick A, B, C or D\n";
				$loopnum = $loopnum + 1;
				goto SUBTRACT;
			} else {
				print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
				exit; 
			}
	
		}
	}
}

sub subtract2 {
	SUBTRACT: while (1) {
		$answer = <>;
		chomp $answer;
		push @answers, $answer;
		if ( $answer =~ m/A|a/ ) {
			$total = $total -3 ;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/B|b/ ) {
			$total = $total - 2;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/C|c/ ) {
			$total = $total - 1;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/D|d/ ) {
			$total = $total;
			$loopnum = 0;
			return $total;
		} else {
			#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
			if ( $loopnum <= 3 ) {
				print "I can't understand that. Please pick A, B, C or D\n";
				$loopnum = $loopnum + 1;
				goto SUBTRACT;
			} else {
				print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
				exit; 
			}
	
		}
	}	
}


sub subtract3 {
	SUBTRACT: while (1) {
		$answer = <>;
		chomp $answer;
		push @answers, $answer;
		if ( $answer =~ m/A|a/ ) {
			$total = $total -1 ;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/B|b/ ) {
			$total = $total - 3;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/C|c/ ) {
			$total = $total;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/D|d/ ) {
			$total = $total - 2;
			$loopnum = 0;
			return $total;
		} else {
			#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
			if ( $loopnum <= 3 ) {
				print "I can't understand that. Please pick A, B, C or D\n";
				$loopnum = $loopnum + 1;
				goto SUBTRACT;
			} else {
				print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
				exit; 
			}
	
		}
	}	
}

sub subtract4 {
	SUBTRACT: while (1) {
		$answer = <>;
		chomp $answer;
		push @answers, $answer;
		if ( $answer =~ m/A|a/ ) {
			$total = $total;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/B|b/ ) {
			$total = $total - 1;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/C|c/ ) {
			$total = $total - 3;
			$loopnum = 0;
			return $total;
		} elsif ( $answer =~ m/D|d/ ) {
			$total = $total - 2;
			$loopnum = 0;
			return $total;
		} else {
			#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
			if ( $loopnum <= 3 ) {
				print "I can't understand that. Please pick A, B, C or D\n";
				$loopnum = $loopnum + 1;
				goto SUBTRACT;
			} else {
				print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
				exit; 
			}
	
		}
	}	
}

sub truefalse1 {
	SUBTRACT: if ( $answer =~ m/T|t/ ) {
		$total = $total -2;
		$loopnum = 0;
		return $total;
	} elsif ( $answer =~ m/F|f/ ) {
		$total = $total;
		$loopnum = 0;
		return $total;
	} else {
		#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
		if ( $loopnum <= 3 ) {
			print "I can't understand that. Please pick A, B, C or D\n";
			$loopnum = $loopnum + 1;
			goto SUBTRACT;
		} else {
			print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
			exit; 
		}

	}
}

sub truefalse2 {
	SUBTRACT: if ( $answer =~ m/T|f/ ) {
		$total = $total;
		$loopnum = 0;
		return $total;
	} elsif ( $answer =~ m/F|f/ ) {
		$total = $total - 2;
		$loopnum = 0;
		return $total;
	} else {
		#continue if $loopnum is less than or equal to 3 otherwise print a error and exit the program. 
		if ( $loopnum <= 3 ) {
			print "I can't understand that. Please pick A, B, C or D\n";
			$loopnum = $loopnum + 1;
			goto SUBTRACT;
		} else {
			print "Error! The test is probably broken. Sorry. Please update to a newer version.\n";
			exit; 
		}

	}
}
sub askquestion {
	$Q = $Q + 1;
	# $ask is the generic question numbering. 
	$ask = "Question: $Q\n";
	return $ask;
}