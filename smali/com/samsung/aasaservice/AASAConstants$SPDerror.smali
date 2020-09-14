.class public final enum Lcom/samsung/aasaservice/AASAConstants$SPDerror;
.super Ljava/lang/Enum;
.source "AASAConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/aasaservice/AASAConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SPDerror"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/samsung/aasaservice/AASAConstants$SPDerror;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/samsung/aasaservice/AASAConstants$SPDerror;

.field public static final enum SPD_FAILED_DOWNLOAD:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

.field public static final enum SPD_FAILED_FILECOPY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

.field public static final enum SPD_FAILED_INTEGRITY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

.field public static final enum SPD_SUCCESS:Lcom/samsung/aasaservice/AASAConstants$SPDerror;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    const-string v1, "SPD_SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/samsung/aasaservice/AASAConstants$SPDerror;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_SUCCESS:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 31
    new-instance v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    const-string v1, "SPD_FAILED_INTEGRITY"

    invoke-direct {v0, v1, v3}, Lcom/samsung/aasaservice/AASAConstants$SPDerror;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_INTEGRITY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 32
    new-instance v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    const-string v1, "SPD_FAILED_DOWNLOAD"

    invoke-direct {v0, v1, v4}, Lcom/samsung/aasaservice/AASAConstants$SPDerror;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_DOWNLOAD:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 33
    new-instance v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    const-string v1, "SPD_FAILED_FILECOPY"

    invoke-direct {v0, v1, v5}, Lcom/samsung/aasaservice/AASAConstants$SPDerror;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_FILECOPY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 29
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sget-object v1, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_SUCCESS:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    aput-object v1, v0, v2

    sget-object v1, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_INTEGRITY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    aput-object v1, v0, v3

    sget-object v1, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_DOWNLOAD:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    aput-object v1, v0, v4

    sget-object v1, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_FILECOPY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    aput-object v1, v0, v5

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->$VALUES:[Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/samsung/aasaservice/AASAConstants$SPDerror;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    return-object v0
.end method

.method public static values()[Lcom/samsung/aasaservice/AASAConstants$SPDerror;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->$VALUES:[Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    invoke-virtual {v0}, [Lcom/samsung/aasaservice/AASAConstants$SPDerror;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    return-object v0
.end method
