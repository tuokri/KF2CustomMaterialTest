class MTPlayerController extends KFPlayerController;

simulated exec function Test()
{
    if (WorldInfo.NetMode == NM_DedicatedServer)
    {
        ServerDoStuff();
    }
    else
    {
        DoStuff();
    }
}

simulated function DoStuff()
{
    local vector Loc;
    local DummyTestActor TestActor;

    Loc = Location + (Normal(vector(Sender.Rotation)) * 500);
    `log("[MaterialTest]: spawning test actor at " $ Loc);
    ClientMessage("[MaterialTest]: spawning test actor at " $ Loc);
    TestActor = Spawn(class'DummyTestActor', Self,, Loc, Rotation);
}

reliable server function ServerDoStuff()
{
    DoStuff();
}
