.class public Lcom/samsung/aasaservice/AASAUpdateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AASAUpdateReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 19
    if-eqz p2, :cond_5

    .line 20
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    .line 21
    .local v3, "intentAction":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    .line 22
    .local v7, "uri":Landroid/net/Uri;
    const-string v4, ""

    .line 23
    .local v4, "packageName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 24
    .local v5, "pm":Landroid/content/pm/PackageManager;
    const/4 v6, -0x1

    .line 26
    .local v6, "uid":I
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v4

    .line 27
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 29
    :cond_1
    const-string v8, "AASAservice-UpdateReceiver"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "AASAUpdateReceiver: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", package = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", uid = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    if-eqz v5, :cond_2

    .line 33
    const/16 v8, 0x80

    :try_start_0
    invoke-virtual {v5, v4, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 34
    .local v0, "appinfo":Landroid/content/pm/ApplicationInfo;
    iget v6, v0, Landroid/content/pm/ApplicationInfo;->uid:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .end local v0    # "appinfo":Landroid/content/pm/ApplicationInfo;
    :cond_2
    :goto_0
    const-string v8, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 52
    const-string v8, "/data/system/.aasa/aasaRuleFile.xml"

    invoke-static {v8}, Lcom/samsung/aasaservice/AASATokenRule;->parseToken(Ljava/lang/String;)Lcom/samsung/aasaservice/AASATokenRule;

    move-result-object v8

    sput-object v8, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    .line 54
    sget-object v8, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    if-eqz v8, :cond_4

    .line 55
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    sget-object v8, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v8, v8, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_5

    .line 56
    sget-object v8, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v8, v8, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    iget-object v8, v8, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 57
    invoke-static {}, Lcom/samsung/aasaservice/AASABinder;->getInstance()Lcom/samsung/aasaservice/AASABinder;

    move-result-object v9

    sget-object v8, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v8, v8, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    iget-object v10, v8, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->permissionName:Ljava/util/ArrayList;

    sget-object v8, Lcom/samsung/aasaservice/AASAService;->rule:Lcom/samsung/aasaservice/AASATokenRule;

    iget-object v8, v8, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    iget-object v8, v8, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    invoke-virtual {v9, v6, v10, v8}, Lcom/samsung/aasaservice/AASABinder;->blockPackageByToken(ILjava/util/ArrayList;Ljava/lang/String;)Z

    .line 55
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 35
    .end local v2    # "i":I
    :catch_0
    move-exception v1

    .line 36
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 61
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_4
    const-string v8, "AASAservice-UpdateReceiver"

    const-string v9, "AASARuleUpdateResult() : Rule file is not exist."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .end local v3    # "intentAction":Ljava/lang/String;
    .end local v4    # "packageName":Ljava/lang/String;
    .end local v5    # "pm":Landroid/content/pm/PackageManager;
    .end local v6    # "uid":I
    .end local v7    # "uri":Landroid/net/Uri;
    :cond_5
    :goto_2
    return-void

    .line 63
    .restart local v3    # "intentAction":Ljava/lang/String;
    .restart local v4    # "packageName":Ljava/lang/String;
    .restart local v5    # "pm":Landroid/content/pm/PackageManager;
    .restart local v6    # "uid":I
    .restart local v7    # "uri":Landroid/net/Uri;
    :cond_6
    const-string v8, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 65
    const-string v8, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 66
    new-instance v2, Landroid/content/Intent;

    const-class v8, Lcom/samsung/aasaservice/AASAService;

    invoke-direct {v2, p1, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 67
    .local v2, "i":Landroid/content/Intent;
    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_2
.end method
