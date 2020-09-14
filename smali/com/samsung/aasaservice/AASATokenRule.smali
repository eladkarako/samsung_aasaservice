.class public Lcom/samsung/aasaservice/AASATokenRule;
.super Ljava/lang/Object;
.source "AASATokenRule.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    }
.end annotation


# instance fields
.field protected packageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;",
            ">;"
        }
    .end annotation
.end field

.field protected validateDate:Ljava/lang/String;

.field protected version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "version"    # Ljava/lang/String;
    .param p2, "validateDate"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    .line 46
    iput-object p1, p0, Lcom/samsung/aasaservice/AASATokenRule;->version:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lcom/samsung/aasaservice/AASATokenRule;->validateDate:Ljava/lang/String;

    .line 48
    return-void
.end method

.method private static checkIntegrity([B)[B
    .locals 15
    .param p0, "contents"    # [B

    .prologue
    .line 283
    const/4 v8, 0x0

    .local v8, "numberIndex":I
    const/4 v5, 0x0

    .line 284
    .local v5, "mContentsSize":I
    const/4 v1, 0x0

    .line 288
    .local v1, "certificate":Ljava/io/InputStream;
    array-length v12, p0

    const/16 v13, 0x100

    if-ge v12, v13, :cond_0

    .line 289
    const-string v12, "AASAservice-TokenRule"

    const-string v13, "checkIntegrity() : The size of contents is less than 256."

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    const/4 v6, 0x0

    .line 331
    :goto_0
    return-object v6

    .line 293
    :cond_0
    const/16 v12, 0x100

    new-array v10, v12, [B

    .line 294
    .local v10, "signedData":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x100

    invoke-static {p0, v12, v10, v13, v14}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 296
    const/4 v12, 0x7

    new-array v11, v12, [B

    .line 297
    .local v11, "tempBuffer":[B
    const/16 v4, 0x100

    .local v4, "i":I
    :goto_1
    aget-byte v12, p0, v4

    const/16 v13, 0x2c

    if-eq v12, v13, :cond_2

    .line 298
    const/4 v12, 0x7

    if-lt v8, v12, :cond_1

    .line 299
    const-string v12, "AASAservice-TokenRule"

    const-string v13, "checkIntegrity() : The numberIndex is more than 7."

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    const/4 v6, 0x0

    goto :goto_0

    .line 302
    :cond_1
    aget-byte v12, p0, v4

    aput-byte v12, v11, v8

    .line 297
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 305
    :cond_2
    new-array v7, v8, [B

    .line 306
    .local v7, "number":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v11, v12, v7, v13, v8}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 308
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v7}, Ljava/lang/String;-><init>([B)V

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 309
    new-array v6, v5, [B

    .line 310
    .local v6, "mTokenContents":[B
    add-int/lit16 v12, v8, 0x100

    const-string v13, ","

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    add-int/2addr v12, v13

    const/4 v13, 0x0

    invoke-static {p0, v12, v6, v13, v5}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 313
    :try_start_0
    const-string v12, "SHA256WithRSAEncryption"

    invoke-static {v12}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v9

    .line 314
    .local v9, "signature":Ljava/security/Signature;
    const-string v12, "x.509"

    invoke-static {v12}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    .line 315
    .local v0, "certFactory":Ljava/security/cert/CertificateFactory;
    new-instance v2, Ljava/io/FileInputStream;

    const-string v12, "/system/etc/aasa_real_crt.crt"

    invoke-direct {v2, v12}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    .end local v1    # "certificate":Ljava/io/InputStream;
    .local v2, "certificate":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v0, v2}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/security/Signature;->initVerify(Ljava/security/cert/Certificate;)V

    .line 317
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 318
    const/4 v12, 0x0

    invoke-virtual {v9, v6, v12, v5}, Ljava/security/Signature;->update([BII)V

    .line 320
    invoke-virtual {v9, v10}, Ljava/security/Signature;->verify([B)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 321
    const-string v12, "AASAservice-TokenRule"

    const-string v13, "checkIntegrity() : Token is verificated."

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v2

    .line 322
    .end local v2    # "certificate":Ljava/io/InputStream;
    .restart local v1    # "certificate":Ljava/io/InputStream;
    goto :goto_0

    .line 324
    .end local v1    # "certificate":Ljava/io/InputStream;
    .restart local v2    # "certificate":Ljava/io/InputStream;
    :cond_3
    const-string v12, "AASAservice-TokenRule"

    const-string v13, "checkIntegrity() : Token is NOT verificated."

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 325
    const/4 v6, 0x0

    .end local v6    # "mTokenContents":[B
    move-object v1, v2

    .end local v2    # "certificate":Ljava/io/InputStream;
    .restart local v1    # "certificate":Ljava/io/InputStream;
    goto/16 :goto_0

    .line 327
    .end local v0    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v9    # "signature":Ljava/security/Signature;
    .restart local v6    # "mTokenContents":[B
    :catch_0
    move-exception v3

    .line 328
    .local v3, "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 331
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 327
    .end local v1    # "certificate":Ljava/io/InputStream;
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v2    # "certificate":Ljava/io/InputStream;
    .restart local v9    # "signature":Ljava/security/Signature;
    :catch_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "certificate":Ljava/io/InputStream;
    .restart local v1    # "certificate":Ljava/io/InputStream;
    goto :goto_2
.end method

.method private static convertFiletoByte(Ljava/io/InputStream;)[B
    .locals 8
    .param p0, "mInputStream"    # Ljava/io/InputStream;

    .prologue
    .line 257
    const/16 v1, 0x400

    .line 258
    .local v1, "mBufferSize":I
    new-array v3, v1, [B

    .line 260
    .local v3, "mByteBuffer":[B
    const/4 v5, 0x0

    .line 262
    .local v5, "mByteRead":I
    if-nez p0, :cond_0

    .line 263
    const-string v6, "AASAservice-TokenRule"

    const-string v7, "convertFiletoByte() : mInputStream is null."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    const/4 v4, 0x0

    .line 277
    :goto_0
    return-object v4

    .line 267
    :cond_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 269
    .local v2, "mByteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :goto_1
    :try_start_0
    invoke-virtual {p0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 270
    const/4 v6, 0x0

    invoke-virtual {v2, v3, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 272
    :catch_0
    move-exception v0

    .line 273
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 275
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    .line 277
    .local v4, "mByteData":[B
    goto :goto_0
.end method

.method private static copyRuleFile([BLjava/lang/String;)Z
    .locals 8
    .param p0, "contents"    # [B
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 336
    const/4 v4, 0x0

    .local v4, "result":Z
    const/4 v3, 0x0

    .line 337
    .local v3, "makeFileResult":Z
    const/4 v1, 0x0

    .line 340
    .local v1, "file":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    .end local v1    # "file":Ljava/io/File;
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 342
    .restart local v1    # "file":Ljava/io/File;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 345
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .line 349
    if-eqz v3, :cond_1

    .line 350
    const-string v5, "AASAservice-TokenRule"

    const-string v6, "copyRuleFile() : Success to make \"aasaRuleFile.xml\" file."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    :cond_0
    :goto_0
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_4

    if-eqz p0, :cond_4

    .line 361
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 362
    .local v2, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v2, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 363
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 369
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    :goto_1
    const-string v5, "AASAservice-TokenRule"

    const-string v6, "copyRuleFile() : Success to copy SPD rule file."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    const/4 v4, 0x1

    :goto_2
    move v5, v4

    .line 376
    :goto_3
    return v5

    .line 352
    :cond_1
    const-string v6, "AASAservice-TokenRule"

    const-string v7, "copyRuleFile() : Fail to make \"aasaRuleFile.xml\" file."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 349
    if-eqz v3, :cond_2

    .line 350
    const-string v5, "AASAservice-TokenRule"

    const-string v6, "copyRuleFile() : Success to make \"aasaRuleFile.xml\" file."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 352
    :cond_2
    const-string v6, "AASAservice-TokenRule"

    const-string v7, "copyRuleFile() : Fail to make \"aasaRuleFile.xml\" file."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 349
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    if-eqz v3, :cond_3

    .line 350
    const-string v5, "AASAservice-TokenRule"

    const-string v7, "copyRuleFile() : Success to make \"aasaRuleFile.xml\" file."

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    throw v6

    .line 352
    :cond_3
    const-string v6, "AASAservice-TokenRule"

    const-string v7, "copyRuleFile() : Fail to make \"aasaRuleFile.xml\" file."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 364
    :catch_1
    move-exception v0

    .line 365
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 366
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v0

    .line 367
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 372
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    const-string v5, "AASAservice-TokenRule"

    const-string v6, "copyRuleFile() : Fail to copy SPD rule file."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    const/4 v4, 0x0

    goto :goto_2
.end method

.method protected static isDebug()Z
    .locals 2

    .prologue
    .line 403
    const-string v1, "ro.debug_level"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 405
    .local v0, "logLevel":Ljava/lang/String;
    const-string v1, "0x4f4c"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 406
    const/4 v1, 0x1

    .line 409
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected static parseToken(Ljava/lang/String;)Lcom/samsung/aasaservice/AASATokenRule;
    .locals 26
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 69
    const/16 v20, 0x0

    .line 70
    .local v20, "tokenFile":Ljava/io/InputStream;
    const-string v22, ""

    .local v22, "version":Ljava/lang/String;
    const-string v4, ""

    .line 71
    .local v4, "date":Ljava/lang/String;
    const/16 v16, 0x0

    .line 72
    .local v16, "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    const/16 v18, 0x0

    .line 74
    .local v18, "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    const/4 v2, 0x0

    .line 76
    .local v2, "copyFileResult":Z
    const-string v23, "AASAservice-TokenRule"

    const-string v24, "parseToken()"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :try_start_0
    new-instance v21, Ljava/io/FileInputStream;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v20    # "tokenFile":Ljava/io/InputStream;
    .local v21, "tokenFile":Ljava/io/InputStream;
    move-object/from16 v20, v21

    .line 85
    .end local v21    # "tokenFile":Ljava/io/InputStream;
    .restart local v20    # "tokenFile":Ljava/io/InputStream;
    :goto_0
    if-nez v20, :cond_0

    .line 87
    const-string v23, "AASAservice-TokenRule"

    const-string v24, "parseToken() : TokenFile is null"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    sget-object v23, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_DOWNLOAD:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sput-object v23, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 90
    const/16 v18, 0x0

    move-object/from16 v19, v18

    .line 252
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .local v19, "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :goto_1
    return-object v19

    .line 81
    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catch_0
    move-exception v6

    .line 82
    .local v6, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v6}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 95
    .end local v6    # "e1":Ljava/io/FileNotFoundException;
    :cond_0
    invoke-static/range {v20 .. v20}, Lcom/samsung/aasaservice/AASATokenRule;->convertFiletoByte(Ljava/io/InputStream;)[B

    move-result-object v13

    .line 96
    .local v13, "mTokenFileByte":[B
    const-string v23, "/data/system/.aasa/aasaRuleFile.xml"

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_2

    .line 97
    move-object v12, v13

    .line 102
    .local v12, "mTokenContents":[B
    :goto_2
    if-nez v12, :cond_3

    .line 104
    sget-object v23, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_INTEGRITY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sput-object v23, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 106
    const/16 v18, 0x0

    .line 108
    if-eqz v20, :cond_1

    .line 110
    :try_start_1
    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_1
    :goto_3
    move-object/from16 v19, v18

    .line 116
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto :goto_1

    .line 99
    .end local v12    # "mTokenContents":[B
    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_2
    invoke-static {v13}, Lcom/samsung/aasaservice/AASATokenRule;->checkIntegrity([B)[B

    move-result-object v12

    .restart local v12    # "mTokenContents":[B
    goto :goto_2

    .line 111
    :catch_1
    move-exception v5

    .line 112
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 121
    .end local v5    # "e":Ljava/io/IOException;
    :cond_3
    :try_start_2
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v8

    .line 122
    .local v8, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v8, v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 123
    invoke-virtual {v8}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v15

    .line 126
    .local v15, "parser":Lorg/xmlpull/v1/XmlPullParser;
    new-instance v23, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, v23

    invoke-direct {v0, v12}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const/16 v24, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 127
    const-string v23, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/16 v24, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-interface {v15, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 129
    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_c
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v7

    .local v7, "eventType":I
    move-object/from16 v19, v18

    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v17, v16

    .line 130
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .local v17, "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    :goto_4
    const/16 v23, 0x1

    move/from16 v0, v23

    if-eq v7, v0, :cond_7

    .line 133
    const/16 v23, 0x2

    move/from16 v0, v23

    if-ne v7, v0, :cond_13

    .line 134
    :try_start_3
    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    .line 136
    .local v14, "name":Ljava/lang/String;
    const-string v23, "VERSION"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_4

    .line 137
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v22

    .line 138
    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : version = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_a
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .line 192
    .end local v14    # "name":Ljava/lang/String;
    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    :goto_5
    :try_start_4
    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v7

    move-object/from16 v19, v18

    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v17, v16

    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto :goto_4

    .line 139
    .restart local v14    # "name":Ljava/lang/String;
    :cond_4
    :try_start_5
    const-string v23, "DATE"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_b

    .line 140
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    .line 141
    invoke-static {}, Lcom/samsung/aasaservice/AASATokenRule;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_5

    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : date = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_5
    const-string v23, ""

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_6

    const-string v23, ""

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_6

    .line 144
    new-instance v18, Lcom/samsung/aasaservice/AASATokenRule;

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v4}, Lcom/samsung/aasaservice/AASATokenRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto :goto_5

    .line 146
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_6
    const-string v23, "AASAservice-TokenRule"

    const-string v24, "Token rule file is wrong!!"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .end local v14    # "name":Ljava/lang/String;
    :cond_7
    if-eqz v19, :cond_18

    const-string v23, "/data/system/.aasa/aasaRuleFile.xml"

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_18

    .line 199
    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 201
    .local v3, "currentVer":I
    invoke-static {}, Lcom/samsung/aasaservice/AASAService;->getConfirmRuleVersion()I

    move-result v23

    sput v23, Lcom/samsung/aasaservice/AASAService;->confirmedVersion:I

    .line 202
    sget v23, Lcom/samsung/aasaservice/AASAService;->confirmedVersion:I

    move/from16 v0, v23

    if-le v3, v0, :cond_15

    .line 203
    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : Update rule file - ver."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    invoke-static {}, Lcom/samsung/aasaservice/AASABinder;->getInstance()Lcom/samsung/aasaservice/AASABinder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/samsung/aasaservice/AASABinder;->initToken()V

    .line 206
    const-string v23, "/data/system/.aasa/aasaRuleFile.xml"

    move-object/from16 v0, v23

    invoke-static {v12, v0}, Lcom/samsung/aasaservice/AASATokenRule;->copyRuleFile([BLjava/lang/String;)Z

    move-result v2

    .line 208
    if-nez v2, :cond_8

    .line 209
    sget-object v23, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_FILECOPY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sput-object v23, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 210
    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    sget-object v25, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_FILECOPY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_a
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 214
    :cond_8
    const/4 v9, 0x0

    .line 216
    .local v9, "fw":Ljava/io/FileWriter;
    :try_start_6
    new-instance v10, Ljava/io/FileWriter;

    const-string v23, "/data/system/.aasa/version.txt"

    move-object/from16 v0, v23

    invoke-direct {v10, v0}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 217
    .end local v9    # "fw":Ljava/io/FileWriter;
    .local v10, "fw":Ljava/io/FileWriter;
    :try_start_7
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "AASA RULE VERSION : "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v10, v0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 218
    invoke-virtual {v10}, Ljava/io/FileWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move-object v9, v10

    .end local v10    # "fw":Ljava/io/FileWriter;
    .restart local v9    # "fw":Ljava/io/FileWriter;
    :cond_9
    :goto_6
    move-object/from16 v18, v19

    .line 243
    .end local v3    # "currentVer":I
    .end local v9    # "fw":Ljava/io/FileWriter;
    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :goto_7
    if-eqz v20, :cond_17

    .line 245
    :try_start_8
    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    move-object/from16 v16, v17

    .end local v7    # "eventType":I
    .end local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    :cond_a
    :goto_8
    move-object/from16 v19, v18

    .line 252
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto/16 :goto_1

    .line 149
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v7    # "eventType":I
    .restart local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v14    # "name":Ljava/lang/String;
    .restart local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    :cond_b
    :try_start_9
    const-string v23, "PACKAGE"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_c

    .line 150
    new-instance v16, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    invoke-direct/range {v16 .. v16}, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;-><init>()V
    :try_end_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_a
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 151
    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    if-eqz v16, :cond_19

    .line 152
    const/16 v23, 0x0

    :try_start_a
    move/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    .line 153
    invoke-static {}, Lcom/samsung/aasaservice/AASATokenRule;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_19

    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : package name = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->pkName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a .. :try_end_a} :catch_d
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_b
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto/16 :goto_5

    .line 155
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_c
    :try_start_b
    const-string v23, "MODEL"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_e

    .line 156
    if-eqz v17, :cond_14

    .line 157
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v23

    const-string v24, ","

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->modelName:[Ljava/lang/String;

    .line 159
    invoke-static {}, Lcom/samsung/aasaservice/AASATokenRule;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_14

    .line 160
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_9
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->modelName:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v11, v0, :cond_d

    .line 161
    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : model name = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->modelName:[Ljava/lang/String;

    move-object/from16 v25, v0

    aget-object v25, v25, v11

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    add-int/lit8 v11, v11, 0x1

    goto :goto_9

    :cond_d
    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_5

    .line 165
    .end local v11    # "i":I
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_e
    const-string v23, "CARRIER"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_10

    .line 166
    if-eqz v17, :cond_14

    .line 167
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v23

    const-string v24, ","

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->carrier:[Ljava/lang/String;

    .line 168
    invoke-static {}, Lcom/samsung/aasaservice/AASATokenRule;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_14

    .line 169
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_a
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->carrier:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v11, v0, :cond_f

    .line 170
    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : carrier = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->carrier:[Ljava/lang/String;

    move-object/from16 v25, v0

    aget-object v25, v25, v11

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    add-int/lit8 v11, v11, 0x1

    goto :goto_a

    :cond_f
    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_5

    .line 174
    .end local v11    # "i":I
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_10
    const-string v23, "CERT"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_11

    .line 175
    if-eqz v17, :cond_14

    .line 176
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->certValue:Ljava/lang/String;

    .line 177
    invoke-static {}, Lcom/samsung/aasaservice/AASATokenRule;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_14

    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : certValue = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->certValue:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_5

    .line 179
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_11
    const-string v23, "PERMISSION"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_14

    .line 180
    if-eqz v17, :cond_12

    .line 181
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;->permissionName:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    :cond_12
    invoke-static {}, Lcom/samsung/aasaservice/AASATokenRule;->isDebug()Z

    move-result v23

    if-eqz v23, :cond_14

    const-string v23, "AASAservice-TokenRule"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parseToken() : permission = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-interface {v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_5

    .line 184
    .end local v14    # "name":Ljava/lang/String;
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_13
    const/16 v23, 0x3

    move/from16 v0, v23

    if-ne v7, v0, :cond_14

    .line 185
    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    .line 187
    .restart local v14    # "name":Ljava/lang/String;
    const-string v23, "PACKAGE"

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_14

    .line 188
    if-eqz v17, :cond_14

    .line 189
    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/samsung/aasaservice/AASATokenRule;->addPackage(Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;)V

    .end local v14    # "name":Ljava/lang/String;
    :cond_14
    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_5

    .line 219
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v3    # "currentVer":I
    .restart local v9    # "fw":Ljava/io/FileWriter;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catch_2
    move-exception v5

    .line 220
    .restart local v5    # "e":Ljava/io/IOException;
    :goto_b
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_a
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 221
    if-eqz v9, :cond_9

    .line 223
    :try_start_c
    invoke-virtual {v9}, Ljava/io/FileWriter;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto/16 :goto_6

    .line 224
    :catch_3
    move-exception v6

    .line 225
    .local v6, "e1":Ljava/io/IOException;
    :try_start_d
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d .. :try_end_d} :catch_4
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_a
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    goto/16 :goto_6

    .line 234
    .end local v3    # "currentVer":I
    .end local v5    # "e":Ljava/io/IOException;
    .end local v6    # "e1":Ljava/io/IOException;
    .end local v9    # "fw":Ljava/io/FileWriter;
    :catch_4
    move-exception v5

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .line 235
    .end local v7    # "eventType":I
    .end local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .local v5, "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    :goto_c
    :try_start_e
    sget-object v23, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_INTEGRITY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sput-object v23, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 236
    const/16 v18, 0x0

    .line 237
    invoke-virtual {v5}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 243
    if-eqz v20, :cond_a

    .line 245
    :try_start_f
    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_5

    goto/16 :goto_8

    .line 246
    :catch_5
    move-exception v5

    .line 247
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_8

    .line 230
    .end local v5    # "e":Ljava/io/IOException;
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v3    # "currentVer":I
    .restart local v7    # "eventType":I
    .restart local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_15
    :try_start_10
    const-string v23, "AASAservice-TokenRule"

    const-string v24, "parseToken() : This rule file is not latest."

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_10 .. :try_end_10} :catch_4
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_a
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 231
    const/16 v18, 0x0

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto/16 :goto_7

    .line 246
    .end local v3    # "currentVer":I
    :catch_6
    move-exception v5

    .line 247
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    move-object/from16 v16, v17

    .line 248
    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_8

    .line 238
    .end local v5    # "e":Ljava/io/IOException;
    .end local v7    # "eventType":I
    .end local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_7
    move-exception v5

    .line 239
    .restart local v5    # "e":Ljava/io/IOException;
    :goto_d
    :try_start_11
    sget-object v23, Lcom/samsung/aasaservice/AASAConstants$SPDerror;->SPD_FAILED_INTEGRITY:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    sput-object v23, Lcom/samsung/aasaservice/AASAService;->SPD_result:Lcom/samsung/aasaservice/AASAConstants$SPDerror;

    .line 240
    const/16 v18, 0x0

    .line 241
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 243
    if-eqz v20, :cond_a

    .line 245
    :try_start_12
    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_8

    goto/16 :goto_8

    .line 246
    :catch_8
    move-exception v5

    .line 247
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_8

    .line 243
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v23

    :goto_e
    if-eqz v20, :cond_16

    .line 245
    :try_start_13
    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_9

    .line 248
    :cond_16
    :goto_f
    throw v23

    .line 246
    :catch_9
    move-exception v5

    .line 247
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f

    .line 243
    .end local v5    # "e":Ljava/io/IOException;
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v7    # "eventType":I
    .restart local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catchall_1
    move-exception v23

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto :goto_e

    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v14    # "name":Ljava/lang/String;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catchall_2
    move-exception v23

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto :goto_e

    .line 238
    .end local v14    # "name":Ljava/lang/String;
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catch_a
    move-exception v5

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto :goto_d

    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v14    # "name":Ljava/lang/String;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catch_b
    move-exception v5

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto :goto_d

    .line 234
    .end local v7    # "eventType":I
    .end local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_c
    move-exception v5

    goto :goto_c

    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v7    # "eventType":I
    .restart local v8    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v14    # "name":Ljava/lang/String;
    .restart local v15    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catch_d
    move-exception v5

    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto :goto_c

    .line 219
    .end local v14    # "name":Ljava/lang/String;
    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v3    # "currentVer":I
    .restart local v10    # "fw":Ljava/io/FileWriter;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :catch_e
    move-exception v5

    move-object v9, v10

    .end local v10    # "fw":Ljava/io/FileWriter;
    .restart local v9    # "fw":Ljava/io/FileWriter;
    goto :goto_b

    .end local v3    # "currentVer":I
    .end local v9    # "fw":Ljava/io/FileWriter;
    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_17
    move-object/from16 v16, v17

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    goto/16 :goto_8

    .end local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_18
    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto/16 :goto_7

    .end local v17    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .end local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v14    # "name":Ljava/lang/String;
    .restart local v16    # "pk":Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;
    .restart local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    :cond_19
    move-object/from16 v18, v19

    .end local v19    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    .restart local v18    # "result_rule":Lcom/samsung/aasaservice/AASATokenRule;
    goto/16 :goto_5
.end method


# virtual methods
.method public addPackage(Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;)V
    .locals 1
    .param p1, "pk"    # Lcom/samsung/aasaservice/AASATokenRule$AASAPackage;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    return-void
.end method

.method public clearAASATokenRule()V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/samsung/aasaservice/AASATokenRule;->packageList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 53
    :cond_0
    return-void
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/samsung/aasaservice/AASATokenRule;->version:Ljava/lang/String;

    return-object v0
.end method
