package Archive::Peek::External::Tar;
use Moose;
extends 'Archive::Peek::External';

sub files {
    my $self = shift;

    my $filename = $self->filename;
    my @files = sort grep { $_ !~ m{/$} } split "\n", qx(tar ft $filename);
    return @files;
}

sub file {
    my ( $self, $filename ) = @_;

    my $archive = $self->filename;
    return qx(tar fxO $archive $filename);
}

1;
