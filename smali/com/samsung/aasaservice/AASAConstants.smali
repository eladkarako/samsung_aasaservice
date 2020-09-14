.class public final Lcom/samsung/aasaservice/AASAConstants;
.super Ljava/lang/Object;
.source "AASAConstants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/samsung/aasaservice/AASAConstants$SPDerror;
    }
.end annotation


# static fields
.field public static final ACCESS_APP_PERMISSIONS:[Ljava/lang/String;

.field public static final ACCESS_AUTORUN:[Ljava/lang/String;

.field public static final ACCESS_SPD_UPDATE:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 6
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "com.sec.android.app.capabilitymanager"

    aput-object v1, v0, v3

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants;->ACCESS_APP_PERMISSIONS:[Ljava/lang/String;

    .line 7
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "com.sec.android.app.capabilitymanager"

    aput-object v1, v0, v3

    const-string v1, "com.samsung.android.sm"

    aput-object v1, v0, v4

    const-string v1, "com.samsung.android.app.sreminder"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "com.sec.android.service.health"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "com.example.aasaclient_autorun"

    aput-object v2, v0, v1

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants;->ACCESS_AUTORUN:[Ljava/lang/String;

    .line 12
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "com.policydm"

    aput-object v1, v0, v3

    const-string v1, "com.example.aasaclient_spdupdate"

    aput-object v1, v0, v4

    sput-object v0, Lcom/samsung/aasaservice/AASAConstants;->ACCESS_SPD_UPDATE:[Ljava/lang/String;

    return-void
.end method
