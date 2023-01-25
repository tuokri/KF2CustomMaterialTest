class MTPlayerController extends KFPlayerController;

var Array<Actor> TestActors;

simulated exec function TestMats()
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

    Loc = Pawn.Location + (Normal(vector(Pawn.Rotation)) * 100);
    `log("[MaterialTest]: spawning test actor at " $ Loc);
    ClientMessage("[MaterialTest]: spawning test actor at " $ Loc);
    TestActors.AddItem(Spawn(class'DummyTestActor', Self,, Loc, Pawn.Rotation));
}

reliable server function ServerDoStuff()
{
    DoStuff();
}
