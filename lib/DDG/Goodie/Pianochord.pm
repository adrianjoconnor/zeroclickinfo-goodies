package DDG::Goodie::Pianochord;

# ABSTRACT: Returns an image representing a piano chord along with a textual representation.

# Start at http://docs.duckduckhack.com/walkthroughs/calculation.html if you are new
# to instant answer development

use DDG::Goodie;
use strict;

zci answer_type => 'pianochord';

# Caching - http://docs.duckduckhack.com/backend-reference/api-reference.html#caching`
zci is_cached => 1;

# Triggers - http://docs.duckduckhack.com/walkthroughs/calculation.html#triggers
triggers any => 'piano chord', 'keyboard chord';

my @major_scale_intervals = (2,2,1,2,2,2,1);
my @minor_scale_intervals = (2,1,2,2,1,2,2);
my @harmonic_minor_scale_intervals = (2,1,2,2,1,3,1);
my @ascending_melodic_minor_scale_intervals = (2,1,2,2,1,3,2);

my @triad_intervals = (0,2,4);

my @note_names = ('A','A#','B','C','C#','D','D#','E','F','F#','G','G#');

# Handle statement
handle remainder => sub {
    our $note_name;

    my $remainder = $_;
    
    
    for my $curNote (0 .. scalar(@note_names)-1 )  {
        if ( $note_names[$curNote] eq uc $remainder ) {
            $note_name = $note_names[$curNote];
            my @chordNotes = ();
            my $intervalTotal = 0;
            for my  $curInterval (0 .. scalar(@major_scale_intervals)-1 )  {
                for my $curChordNote (0 .. scalar(@triad_intervals)-1 )  {
                    if ( $curInterval == $triad_intervals[$curChordNote] ) {
                        my $index = (12 + $curNote + $intervalTotal ) % 12;
                        push @chordNotes, $note_names[$index];
                    }
                }
                $intervalTotal = $intervalTotal + $major_scale_intervals[$curInterval];
            }
            return
                heading => "Piano $note_name maj Chord",
                answer => join(" ", @chordNotes),
                html => "<span>Notes " . join(" ", @chordNotes) . "</span>";
        }
    }

    return;
};

1;
