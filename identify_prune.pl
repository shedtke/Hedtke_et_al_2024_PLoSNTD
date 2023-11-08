#!/usr/bin/perl

my %seen;
my $cutoff=0.1;

while (<>) {
## keep the first SNP in the chromosome
	my @line=split(/\t/,$_);
	my $chrom=$line[0];
	my $pos=$line[2];
	if ($seen{$chrom}) {
		if ($line[4]>$cutoff) {
			unless ($seen{$chrom.$pos}) {print "$chrom\t$pos\n"; $seen{$chrom.$pos}++;}
		}
	}
	$seen{$chrom}++;


}
end;
