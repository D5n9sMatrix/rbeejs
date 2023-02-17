package comment;
use strict;
use warnings FATAL => 'all';

# Section 2.2: Multi-line comments
#     Multi-line comments start with = and with the =cut statement. These are special comments called POD (Plain Old
#     Documentation).
#     Any text between the markers will be commented out:

=begin comment

This is another comment.
And it spans multiple lines!

=end comment

=cut

1;