package Pg::SQL::Parser;

use v5.12;
use strict;
use warnings;

use Pg::SQL::Parser::Lexer qw( get_yylex );
use Pg::SQL::Parser::SQL;

=head1 NAME

Pg::SQL::Parser - Parser of SQL queries, handling PostgreSQL extensions

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Pg::SQL::Parser is used to parse given SQL query/queries into objects.

    use Pg::SQL::Parser;

    my $parser = Pg::SQL::Parser->new();
    my $queries = $parser->parse( 'SELECT a, b FROM c; SELECT 2 + 3 from d' );
    ...

=head1 SUBROUTINES/METHODS

=head2 new()

Object constructor. No logic there.

=cut

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    $self->{ 'parser' } = Pg::SQL::Parser::SQL->new();
    return $self;
}

=head2 parse()

Main function - parses given queries returning arrayref of Pg::SQL::Parser::Statement objects.

=cut

sub parse {
    my $self  = shift;
    my $query = shift;

    return $self->{ 'parser' }->YYParse( yylex => get_yylex( $query ) );
}

=head1 AUTHOR

Hubert depesz Lubaczewski, C<< <depesz at depesz.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-pg-sql-parser at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Pg-SQL-Parser>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Pg::SQL::Parser


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Pg-SQL-Parser>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Pg-SQL-Parser>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Pg-SQL-Parser>

=item * Search CPAN

L<http://search.cpan.org/dist/Pg-SQL-Parser/>

=back


=head1 Said about Pg::SQL::Parser

=over

=item * 2012-09-12, irc, #postgresql

    * andres thinks developing a correct parser is pretty crazy

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Hubert depesz Lubaczewski.

This program is distributed under the (Revised) BSD License:
L<http://www.opensource.org/licenses/bsd-license.php>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

* Neither the name of Hubert depesz Lubaczewski's Organization
nor the names of its contributors may be used to endorse or promote
products derived from this software without specific prior written
permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1;    # End of Pg::SQL::Parser
