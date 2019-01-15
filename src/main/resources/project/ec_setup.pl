my %runPython = (
    label       => "Python - Run Python Script",
    procedure   => "runPython",
    description => "Run a user-supplied Python script",
    category    => "Scripting/Shell"
);

# There were some mispellings
$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Phyton - runPython");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Phyton - Run Python");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/EC-Python - runPython");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Python - Run Python");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Python - Run Python Script");

@::createStepPickerSteps = (\%runPython);
