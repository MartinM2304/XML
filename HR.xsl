<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; }
                    h2 { color: #333; }
                    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
                    th { background-color: #4CAF50; color: white; padding: 8px; }
                    td { border: 1px solid #ddd; padding: 8px; text-align: center; }
                    tr:nth-child(even) { background-color: #f2f2f2; }
                    tr:hover { background-color: #ddd; }
                </style>
            </head>
            <body>
                <h2>HR Catalogue</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Group Name</th>
                        <th>Subgroup Name</th>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Rank</th>
                        <th>Employment Type</th>
                        <th>Age</th>
                        <th>Experience (years)</th>
                        <th>Salary</th>
                        <th>Skills</th>
                    </tr>
                    <xsl:for-each select="hr_catalogue/groups/group">
                        <xsl:variable name="groupName" select="@name" />
                        <xsl:for-each select="subgroup">
                            <xsl:variable name="subgroupName" select="@name" />
                            <xsl:for-each select="employee">
                                <tr>
                                    <td><xsl:value-of select="$groupName" /></td>
                                    <td><xsl:value-of select="$subgroupName" /></td>
                                    <td><xsl:value-of select="@id" /></td>
                                    <td><xsl:value-of select="name" /></td>
                                    <td><xsl:value-of select="rank" /></td>
                                    <td><xsl:value-of select="employment/@type" /></td>
                                    <td><xsl:value-of select="personal_data/age" /></td>
                                    <td><xsl:value-of select="personal_data/experience" /></td>
                                    <td><xsl:value-of select="personal_data/salary" /></td>
                                    <td>
                                        <xsl:for-each select="skills/skill">
                                            <xsl:value-of select="." />
                                            <xsl:if test="position() != last()">, </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
