class MaterialTest extends KFMutator
    config(Mutator_MaterialTest);

var Material DummyMat;
var Object DummyObject;

function PreBeginPlay()
{
    super.PreBeginPlay();
    SetPC();
}

function InitMutator(string Options, out string ErrorMessage)
{
    `log("[MaterialTest]: InitMutator(), DummyMat = " $ DummyMat);
    super.InitMutator(Options,ErrorMessage);
}

function NotifyLogin(Controller NewPlayer)
{
    ClientSetPC();
    super.NotifyLogin(NewPlayer);
}

function SetPC()
{
    WorldInfo.Game.PlayerControllerClass=class'MTPlayerController';
}

reliable client function ClientSetPC()
{
    SetPC();
}

DefaultProperties
{
    DummyMat=Material'MaterialTestPackage.TestMat'
    DummyObject=Material'MaterialTestPackage.TestMat'
}
