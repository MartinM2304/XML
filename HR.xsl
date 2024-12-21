<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:hr="http://www.example/HRCatalogue/types"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8" />

    <!-- Template for the root element -->
    <xsl:template match="/hr_catalogue">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="./HR.css" />
            </head>
            <body>
                <xsl:apply-templates select="groups/group/subgroup/employee">
                    <xsl:sort select="name" data-type="text" order="ascending" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <!-- Template for employee -->
    <xsl:template match="employee">
        <div class="employee-card">
            <img class="employee-photo" src="{photo}" alt="Employee Photo" />

            <div class="employee-info">
                <h2>
                    <xsl:value-of select="name" />
                </h2>
                <p>
                    <strong>Rank: </strong>
                    <xsl:value-of select="rank" />
                </p>
                <p>
                    <strong>Employment Type: </strong>
                    <xsl:value-of select="employment/@type" />
                </p>
                <div class="section">
                    <h3>Department</h3>
                    <div class="department">
                        <p>
                            <strong>Group: </strong>
                            <xsl:value-of select="ancestor::group/@name" />
                        </p>
                        <p>
                            <strong>Subgroup: </strong>
                            <xsl:value-of select="ancestor::subgroup/@name" />
                        </p>
                    </div>
                </div>

                <div class="section">
                    <h3>Personal Data</h3>
                    <div class="personal-data">
                        <p>
                            <strong>Age: </strong>
                            <xsl:value-of select="personal_data/age" />
                        </p>
                        <p>
                            <strong>Experience: </strong>
                            <xsl:value-of select="personal_data/experience" />
                            <span> years</span>
                        </p>
                        <p>
                            <strong>Salary: </strong>$ <xsl:value-of
                                select="personal_data/salary" />
                        </p>
                    </div>
                </div>

                <div class="section">
                    <h3>Skills</h3>
                    <div class="skills">
                        <xsl:for-each select="skills/skill">
                            <p>
                                <xsl:value-of select="." />
                            </p>
                        </xsl:for-each>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>