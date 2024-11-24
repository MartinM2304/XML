<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" />

    <xsl:template match="/hr_catalogue">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="./HR.css" />
            </head>

            <body>
                <h1>HR Catalogue</h1>
                <xsl:apply-templates select="groups/group/subgroup/employee" />
            </body>
        </html>
    </xsl:template>


    <xsl:template match="employee">
        <div class="employee-card">
            <img class="employee-photo" src="{photo}" alt="Employee Photo" />

            <div class="employee-info">
                <h2>
                    <xsl:value-of select="name" />
                </h2>
                <p>
                    <strong>Rank:</strong>
                    <xsl:value-of select="rank" />
                </p>
                <p>
                    <strong>Employment Type:</strong>
                    <xsl:value-of select="employment/@type" />
                </p>
                <p>
                    <strong>Group:</strong>
                    <xsl:value-of select="ancestor::group/@name" />
                </p>
                <p>
                    <strong>Subgroup:</strong>
                    <xsl:value-of select="ancestor::subgroup/@name" />
                </p>

                <div class="section">
                    <h3>Personal Data</h3>
                    <p>
                        <strong>Age:</strong>
                        <xsl:value-of select="personal_data/age" />
                    </p>
                    <p><strong>Experience:</strong> <xsl:value-of select="personal_data/experience" />
        years</p>
                    <p><strong>Salary:</strong> $<xsl:value-of select="personal_data/salary" /></p>
                </div>

                <div class="section">
                    <h3>Skills</h3>
                    <p>
                        <xsl:for-each select="skills/skill">
                            <span>
                                <xsl:value-of select="." />
                                <xsl:if test="position() != last()">, </xsl:if>
                            </span>
                        </xsl:for-each>
                    </p>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>