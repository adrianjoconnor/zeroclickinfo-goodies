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

my @note_names = ('A','A#','B','C','C#','D','D#','E','F','F#','G','G#');

# Handle statement
handle remainder => sub {

    my $remainder = $_;

    for( $curNote = 0; $curNote < length @note_names ; $curNote = $curNote + 1 ){
        if ( @note_names[$curNote] eq uc $remainder ) {
            return
                heading => "Piano @note_names[$curNote]maj Chord",
                answer => "C E G",
                html => "<span>notes C E G</span>";
        }
    }

    return
};

1;
