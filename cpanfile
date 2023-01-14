on 'runtime' => sub {
    requires 'perl' => '5.008';
    requires 'strict';
    requires 'warnings';
    requires 'overload';
    requires 'parent';
    requires 'Carp';
    requires 'Exporter' => '5.57';
    requires 'File::Spec';
    requires 'FileHandle';
    requires 'IO::File';
    requires 'IO::Handle';
    requires 'Symbol';
};

on 'build' => sub {
    requires 'ExtUtils::MakeMaker';
};

on 'test' => sub {
    requires 'strict';
    requires 'warnings';
    requires 'ExtUtils::MakeMaker';
    requires 'File::Basename';
    requires 'File::Spec';
    requires 'File::Temp';
    requires 'FileHandle';
    requires 'IO::File';
    requires 'IO::Handle';
    requires 'Symbol';
    requires 'Test::More' => '0.88'; # already uses done_testing
    requires 'Test::Tester';
};
