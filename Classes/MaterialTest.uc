class MaterialTest extends KFMutator
    config(Mutator_MaterialTest);

var Material DummyMat;

function InitMutator(string Options, out string ErrorMessage)
{
    `log("[MaterialTest]: InitMutator(), DummyMat = " $ DummyMat);
    super.InitMutator(Options,ErrorMessage);
}

function Mutate(string MutateString, PlayerController Sender)
{
    local vector Loc;
    local DummyTestActor TestActor;

    if (MutateString ~= "test")
    {
        Loc = Sender.Location + (Normal(vector(Sender.Rotation)) * 500);
        `log("[MaterialTest]: spawning test actor at " $ Loc);
        Sender.ClientMessage("[MaterialTest]: spawning test actor at " $ Loc);
        TestActor = Spawn(class'DummyTestActor', Self,, Loc, Sender.Rotation);
    }

    super.Mutate(MutateString, Sender);
}

DefaultProperties
{
    DummyMat=Material'MaterialTestPackage.TestMat'
}
