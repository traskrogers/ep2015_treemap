use strict;
use warnings;
use JSON;

my $file = 'ep.csv';
my @data;

open(my $fh, '<', $file) or die "Can't read '$file' [$!]\n";
while (my $line = <$fh>) {
    chomp $line;
    my @fields = split(/,/, $line);
    push @data, \@fields;
}

my $json = JSON->new->utf8;
my @inner_hash;

for (my $i = 1; $i <= 70; $i++) {
    my $str->{'story'} = $data[$i][0];
    $str->{'parent'} = $data[$i][1];
    $str->{'est_days'} = $data[$i][2];
    $str->{'progress'} = $data[$i][3];

    push @inner_hash, $str;
}

my $hash->{'count'} = scalar @data;
$hash->{'week'} = [0];
$hash->{'week'}[0] = \@inner_hash;

print $json->encode($hash) . "\n";
