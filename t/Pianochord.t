#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => "pianochord";
zci is_cached   => 1;

ddg_goodie_test(
    [qw( DDG::Goodie::Pianochord )],
    'pianochord test C' => test_zci(
        'Piano chord Cmaj = C E G',
        structured_answer => {
            input     => [' C'],
            operation => 'Piano Chord',
            result    => 'C E G'
        }
    )
);

done_testing;
