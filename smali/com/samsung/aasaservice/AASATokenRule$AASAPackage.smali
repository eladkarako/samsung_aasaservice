.class public Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
.super Ljava/lang/Object;
.source "AASATokenRule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/samsung/aasaservice/AASATokenRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "AASAPackage"
.end annotation


# instance fields
.field protected carrier:[Ljava/lang/String;

.field protected certValue:Ljava/lang/String;

.field protected modelName:[Ljava/lang/String;

.field protected permissionName:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected pkName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->permissionName:Ljava/util/ArrayList;

    .line 41
    return-void
.end method
