on 'runtime' => sub {
    requires 'perl' => '5.008';
    requires 'strict';
    requires 'warnings';
    requires 'overload';
    requires 'Carp';
    requires 'Exporter';
    requires 'FileHandle';
    requires 'IO::File';
    requires 'IO::Handle';
    requires 'Symbol';
};

on 'test' => sub {
    requires 'File::Spec';
    requires 'File::Temp';
    requires 'Test::More';
};
