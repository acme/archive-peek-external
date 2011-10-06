package Archive::Peek::External::Zip;
use Moose;
extends 'Archive::Peek::External';

sub files {
    my $self = shift;

    my $filename = $self->filename;
    my @files = sort grep { $_ !~ m{/$} }
        map { ( split '\s+', $_ )[-1] } qx(unzip -lqq $filename);
    return @files;
}

sub file {
    my ( $self, $filename ) = @_;

    my $archive = $self->filename;
    return qx(unzip -pqq $archive $filename);
}

1;
