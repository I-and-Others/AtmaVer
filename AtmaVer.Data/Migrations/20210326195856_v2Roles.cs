using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace AtmaVer.Data.Migrations
{
    public partial class v2Roles : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "RecordedAtDate", "UpdatedAtDate" },
                values: new object[] { new DateTime(2021, 3, 26, 22, 58, 54, 638, DateTimeKind.Local).AddTicks(6290), new DateTime(2021, 3, 26, 22, 58, 54, 638, DateTimeKind.Local).AddTicks(6330) });

            migrationBuilder.UpdateData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "RecordedAtDate", "UpdatedAtDate" },
                values: new object[] { new DateTime(2021, 3, 26, 22, 58, 54, 638, DateTimeKind.Local).AddTicks(8940), new DateTime(2021, 3, 26, 22, 58, 54, 638, DateTimeKind.Local).AddTicks(8950) });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "BirthDate", "PasswordHash", "RecordedAtDate", "SecretKey", "UpdatedAtDate" },
                values: new object[] { new DateTime(2021, 3, 26, 22, 58, 54, 613, DateTimeKind.Local).AddTicks(6800), "4169a2008a2aabf13b8d10801458d49c98dd616487c4e4d71745fb8b0b424c90ae3f386deb75ec193c91f301aa0507b371733e88d13adbd86b1dc2ae76540369", new DateTime(2021, 3, 26, 22, 58, 54, 613, DateTimeKind.Local).AddTicks(680), "486a1e6f09ce446fae81479f3c3787c33/26/2021105854PM", new DateTime(2021, 3, 26, 22, 58, 54, 613, DateTimeKind.Local).AddTicks(720) });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "RecordedAtDate", "UpdatedAtDate" },
                values: new object[] { new DateTime(2021, 3, 7, 2, 36, 6, 773, DateTimeKind.Local).AddTicks(1810), new DateTime(2021, 3, 7, 2, 36, 6, 773, DateTimeKind.Local).AddTicks(1850) });

            migrationBuilder.UpdateData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "RecordedAtDate", "UpdatedAtDate" },
                values: new object[] { new DateTime(2021, 3, 7, 2, 36, 6, 773, DateTimeKind.Local).AddTicks(8240), new DateTime(2021, 3, 7, 2, 36, 6, 773, DateTimeKind.Local).AddTicks(8270) });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "BirthDate", "PasswordHash", "RecordedAtDate", "SecretKey", "UpdatedAtDate" },
                values: new object[] { new DateTime(2021, 3, 7, 2, 36, 6, 761, DateTimeKind.Local).AddTicks(5440), "0e1454d315361d746cc6e5a3f89c1288e2cb40cc028587659dabf8d6d605e475f530e8030a8930f521cfd25f5d7fd44f44b752da71b2e235fcdc996e6912fc0c", new DateTime(2021, 3, 7, 2, 36, 6, 761, DateTimeKind.Local).AddTicks(420), "2607dee3756d42bf89e231e1fd68b6243/7/202123606AM", new DateTime(2021, 3, 7, 2, 36, 6, 761, DateTimeKind.Local).AddTicks(480) });
        }
    }
}
