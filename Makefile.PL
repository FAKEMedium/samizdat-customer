use strict;
use warnings;
use ExtUtils::MakeMaker;
use File::Find;
my %pm;
find(sub {
  return unless -f; return if /\.(bak|orig|rej|swp)$/;
  my $path = $File::Find::name; (my $rel = $path) =~ s{^lib/}{};
  $pm{$path} = "\$(INST_LIB)/$rel";
}, 'lib');
WriteMakefile(
  NAME             => 'Samizdat::Plugin::Customer',
  VERSION          => '0.01',
  ABSTRACT         => 'Customer entities, billing, services for Samizdat (foundational)',
  AUTHOR           => 'Hans Svensson <hans@alipang.se>',
  LICENSE          => 'artistic_2',
  MIN_PERL_VERSION => '5.036',
  PM               => \%pm,
  PREREQ_PM        => {
    'Mojolicious' => '9.0',
    'Business::Tax::VAT::Validation' => 0,
  },
  TEST_REQUIRES    => { 'Test::More' => 0 },
  META_MERGE       => {
    'meta-spec' => { version => 2 },
    prereqs     => { runtime => { requires => { 'Samizdat' => 0 } } },
    no_index    => { directory => ['lib/Samizdat/resources'] },
  },
  dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
  clean => { FILES => 'Samizdat-Plugin-Customer-*' },
);
